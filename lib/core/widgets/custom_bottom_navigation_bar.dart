import 'package:alasfor/core/constants/app_colors.dart';
import 'package:alasfor/core/widgets/painters/arc_painter.dart';
import 'package:flutter/material.dart';

/// Data class for navigation bar items
class NavItem {
  final IconData icon;
  final IconData activeIcon;
  final String? label;

  const NavItem({required this.icon, required this.activeIcon, this.label});
}

/// CustomBottomNavigationBar with symmetrical arch shape.
/// The arch curves UP in the center and down to the sides.
/// Left and right sides are positioned identically for symmetry.
class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final List<NavItem>? items;

  // Default navigation items
  static const List<NavItem> defaultItems = [
    NavItem(icon: Icons.person_outline, activeIcon: Icons.person),
    NavItem(icon: Icons.emoji_events_outlined, activeIcon: Icons.emoji_events),
    NavItem(icon: Icons.home_outlined, activeIcon: Icons.home),
    NavItem(icon: Icons.inventory_2_outlined, activeIcon: Icons.inventory_2),
    NavItem(
      icon: Icons.qr_code_scanner_outlined,
      activeIcon: Icons.qr_code_scanner,
    ),
  ];

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    this.items,
  });

  List<NavItem> get _items => items ?? defaultItems;

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    const arcHeight = 25.0;
    final totalHeight = 60.0 + bottomPadding + arcHeight;
    final screenWidth = MediaQuery.of(context).size.width;

    // Symmetrical positioning values
    const outerPosition = 0.02; // Same for both sides
    const innerPosition = 0.22; // Same for both sides
    const outerBottom = 4.0; // Same height for outer icons
    const innerBottom = 25.0; // Same height for inner icons

    return SizedBox(
      height: totalHeight,
      child: CustomPaint(
        painter: SmoothArchPainter(
          color: AppColors.primary,
          arcHeight: arcHeight,
        ),
        child: SizedBox(
          height: totalHeight,
          child: Padding(
            padding: EdgeInsets.only(bottom: bottomPadding),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                // Left outer icon (index 0)
                Positioned(
                  left: screenWidth * outerPosition,
                  bottom: outerBottom,
                  child: _buildNavItem(item: _items[0], index: 0),
                ),

                // Left inner icon (index 1)
                Positioned(
                  left: screenWidth * innerPosition,
                  bottom: innerBottom,
                  child: _buildNavItem(item: _items[1], index: 1),
                ),

                // Center icon (index 2) - at the peak of the arch
                Positioned(
                  left: 0,
                  right: 0,
                  top: -15,
                  child: Center(child: _buildCenterButton()),
                ),

                // Right inner icon (index 3) - symmetrical to left inner
                Positioned(
                  right: screenWidth * innerPosition,
                  bottom: innerBottom,
                  child: _buildNavItem(item: _items[3], index: 3),
                ),

                // Right outer icon (index 4) - symmetrical to left outer
                Positioned(
                  right: screenWidth * outerPosition,
                  bottom: outerBottom,
                  child: _buildNavItem(item: _items[4], index: 4),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({required NavItem item, required int index}) {
    final isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () => onTap(index),
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: AnimatedScale(
          scale: isSelected ? 1.2 : 1.0,
          duration: const Duration(milliseconds: 200),
          child: Icon(
            isSelected ? item.activeIcon : item.icon,
            color: isSelected ? AppColors.secondary : AppColors.white,
            size: 28,
          ),
        ),
      ),
    );
  }

  Widget _buildCenterButton() {
    final centerItem = _items[2];

    return GestureDetector(
      onTap: () => onTap(2),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          gradient: AppColors.goldGradient,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: AppColors.goldDark.withOpacity(0.4),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Icon(centerItem.activeIcon, size: 28, color: AppColors.white),
      ),
    );
  }
}
