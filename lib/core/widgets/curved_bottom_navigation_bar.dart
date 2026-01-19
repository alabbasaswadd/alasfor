import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import 'painters/arc_painter.dart';

/// A navigation item for the [CurvedBottomNavigationBar].
class NavBarItem {
  /// The icon to display when inactive.
  final IconData icon;

  /// The icon to display when active (optional).
  final IconData? activeIcon;

  /// The label for the item (optional).
  final String? label;

  const NavBarItem({required this.icon, this.activeIcon, this.label});
}

/// A curved bottom navigation bar with an upward arch shape.
///
/// The arch curves UP in the center and down to the sides.
/// Icons follow the arch curve:
/// - 2 on the left (positioned along the curve)
/// - 1 at the top center (at the peak)
/// - 2 on the right (positioned along the curve)
class CurvedBottomNavigationBar extends StatelessWidget {
  /// The currently selected index.
  final int currentIndex;

  /// Callback when an item is tapped.
  final ValueChanged<int> onTap;

  /// List of navigation items (should be exactly 5 items).
  /// Order: [left1, left2, center, right1, right2]
  final List<NavBarItem>? items;

  /// Background color of the navigation bar.
  final Color? backgroundColor;

  /// Color of the active icon.
  final Color? activeColor;

  /// Color of inactive icons.
  final Color? inactiveColor;

  /// Height of the arch.
  final double arcHeight;

  /// The height of the navigation bar.
  final double height;

  /// Size of the center icon container.
  final double centerIconSize;

  /// Whether to use the smooth arch style.
  final bool useSmoothArch;

  const CurvedBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    this.items,
    this.backgroundColor,
    this.activeColor,
    this.inactiveColor,
    this.arcHeight = 35.0,
    this.height = 80.0,
    this.centerIconSize = 56.0,
    this.useSmoothArch = true,
  });

  List<NavBarItem> get _defaultItems => const [
    NavBarItem(icon: Icons.person_outline, activeIcon: Icons.person),
    NavBarItem(
      icon: Icons.emoji_events_outlined,
      activeIcon: Icons.emoji_events,
    ),
    NavBarItem(icon: Icons.camera_alt_outlined, activeIcon: Icons.camera_alt),
    NavBarItem(icon: Icons.inventory_2_outlined, activeIcon: Icons.inventory_2),
    NavBarItem(
      icon: Icons.qr_code_scanner_outlined,
      activeIcon: Icons.qr_code_scanner,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final navItems = items ?? _defaultItems;
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    final totalHeight = height + bottomPadding + arcHeight;

    return SizedBox(
      height: totalHeight,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Main navigation bar with arch
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomPaint(
              painter: useSmoothArch
                  ? SmoothArchPainter(
                      color: backgroundColor ?? AppColors.primary,
                      arcHeight: arcHeight,
                    )
                  : ArcNavBarPainter(
                      color: backgroundColor ?? AppColors.primary,
                      arcHeight: arcHeight,
                    ),
              child: SizedBox(height: totalHeight),
            ),
          ),

          // Icons positioned along the arch curve
          Positioned(
            bottom: bottomPadding,
            left: 0,
            right: 0,
            top: 0,
            child: _buildArchIcons(context, navItems),
          ),
        ],
      ),
    );
  }

  Widget _buildArchIcons(BuildContext context, List<NavBarItem> navItems) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        // Left outer icon (index 0) - at the edge, lowest position
        Positioned(
          left: screenWidth * 0.08,
          bottom: 12,
          child: _buildNavItem(item: navItems[0], index: 0),
        ),

        // Left inner icon (index 1) - slightly higher on the curve
        Positioned(
          left: screenWidth * 0.22,
          bottom: 28,
          child: _buildNavItem(item: navItems[1], index: 1),
        ),

        // Center icon (index 2) - at the peak of the arch
        Positioned(
          left: 0,
          right: 0,
          top: 2,
          child: Center(child: _buildCenterItem(navItems[2], 2)),
        ),

        // Right inner icon (index 3) - slightly higher on the curve
        Positioned(
          right: screenWidth * 0.22,
          bottom: 28,
          child: _buildNavItem(item: navItems[3], index: 3),
        ),

        // Right outer icon (index 4) - at the edge, lowest position
        Positioned(
          right: screenWidth * 0.08,
          bottom: 12,
          child: _buildNavItem(item: navItems[4], index: 4),
        ),
      ],
    );
  }

  Widget _buildNavItem({required NavBarItem item, required int index}) {
    final isSelected = currentIndex == index;
    final color = isSelected
        ? (activeColor ?? AppColors.secondary)
        : (inactiveColor ?? AppColors.white);

    return GestureDetector(
      onTap: () => onTap(index),
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.all(8),
        child: AnimatedScale(
          scale: isSelected ? 1.2 : 1.0,
          duration: const Duration(milliseconds: 200),
          child: Icon(
            isSelected ? (item.activeIcon ?? item.icon) : item.icon,
            color: color,
            size: 28,
          ),
        ),
      ),
    );
  }

  Widget _buildCenterItem(NavBarItem item, int index) {
    final isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () => onTap(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: centerIconSize,
        height: centerIconSize,
        decoration: BoxDecoration(
          gradient: isSelected
              ? AppColors.goldGradient
              : LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.white.withOpacity(0.9),
                    AppColors.white.withOpacity(0.7),
                  ],
                ),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: isSelected
                  ? AppColors.goldDark.withOpacity(0.4)
                  : Colors.black.withOpacity(0.2),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Icon(
          isSelected ? (item.activeIcon ?? item.icon) : item.icon,
          color: isSelected ? AppColors.white : AppColors.primary,
          size: 28,
        ),
      ),
    );
  }
}

/// A simpler curved bottom navigation bar without the elevated center icon.
class SimpleCurvedBottomNavigationBar extends StatelessWidget {
  /// The currently selected index.
  final int currentIndex;

  /// Callback when an item is tapped.
  final ValueChanged<int> onTap;

  /// List of navigation items.
  final List<NavBarItem>? items;

  /// Background color of the navigation bar.
  final Color? backgroundColor;

  /// The height of the arch at the top.
  final double arcHeight;

  const SimpleCurvedBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    this.items,
    this.backgroundColor,
    this.arcHeight = 25.0,
  });

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    final navItems =
        items ??
        const [
          NavBarItem(icon: Icons.home_outlined, activeIcon: Icons.home),
          NavBarItem(icon: Icons.search_outlined, activeIcon: Icons.search),
          NavBarItem(icon: Icons.favorite_outline, activeIcon: Icons.favorite),
          NavBarItem(icon: Icons.person_outline, activeIcon: Icons.person),
        ];

    return CustomPaint(
      painter: ArcNavBarPainter(
        color: backgroundColor ?? AppColors.primary,
        arcHeight: arcHeight,
      ),
      child: Container(
        height: 80.0 + bottomPadding + arcHeight,
        padding: EdgeInsets.only(bottom: bottomPadding, top: arcHeight),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: navItems.asMap().entries.map((entry) {
            final index = entry.key;
            final item = entry.value;
            final isSelected = currentIndex == index;

            return GestureDetector(
              onTap: () => onTap(index),
              behavior: HitTestBehavior.opaque,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Icon(
                  isSelected ? (item.activeIcon ?? item.icon) : item.icon,
                  color: isSelected ? AppColors.secondary : AppColors.white,
                  size: 28,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
