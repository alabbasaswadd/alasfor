// Export all widgets for easy importing
export 'custom_wave_app_bar.dart';
export 'curved_bottom_navigation_bar.dart';
export 'clippers/wave_clipper.dart';
export 'painters/arc_painter.dart';
export '../constants/app_colors.dart';
import 'package:alasfor/core/constants/app_images.dart';
import 'package:alasfor/core/constants/app_text.dart';
import 'package:alasfor/pages/notifications/screen/notifications_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../constants/app_colors.dart';
import 'clippers/wave_clipper.dart';
import 'painters/arc_painter.dart';

/// Legacy CustomAppBar that now uses the wave shape.
/// For full customization, use [CustomWaveAppBar] directly.
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? leading;
  final List<Widget>? actions;
  final Widget? child;
  final bool centerTitle;
  final Color? backgroundColor;
  final double elevation;
  final bool showNotification;
  final bool showProfileAvatar;

  const CustomAppBar({
    super.key,
    this.title,
    this.leading,
    this.actions,
    this.child,
    this.centerTitle = true,
    this.backgroundColor,
    this.elevation = 0,
    this.showNotification = true,
    this.showProfileAvatar = true,
  });

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).padding.top;

    return ClipPath(
      clipper: const SmoothWaveClipper(waveDepth: 30.0),
      child: Container(
        height: preferredSize.height + statusBarHeight,
        decoration: const BoxDecoration(gradient: AppColors.primaryGradient),
        child: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              children: [
                // Top row with avatar, logo/title, and notification
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Leading: Profile icon at the start (left)
                    if (leading != null)
                      leading!
                    else if (showProfileAvatar)
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage(AppImages.person),
                      )
                    else
                      const SizedBox(width: 40),

                    // Center: Logo or title
                    if (title != null)
                      Expanded(
                        child: Center(
                          child: AppText.custom(
                            title!,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.white,
                          ),
                        ),
                      )
                    else
                      Expanded(
                        child: Center(child: Image.asset(AppImages.logo)),
                      ),

                    // Actions: Notification icon at the end (right)
                    if (actions != null && actions!.isNotEmpty)
                      ...actions!
                    else if (showNotification)
                      IconButton(
                        icon: const Icon(
                          Icons.notifications_outlined,
                          color: AppColors.white,
                        ),
                        onPressed: () {
                          context.push("/notifications");
                        },
                      )
                    else
                      const SizedBox(width: 40),
                  ],
                ),

                // Child widget (e.g., search field)
                if (child != null) ...[const SizedBox(height: 12), child!],
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(child != null ? 220.0 : 220.0);
}
