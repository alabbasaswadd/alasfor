// Export all widgets for easy importing
export 'custom_wave_app_bar.dart';
export 'curved_bottom_navigation_bar.dart';
export 'clippers/wave_clipper.dart';
export 'painters/arc_painter.dart';
export '../constants/app_colors.dart';

import 'package:alasfor/core/constants/app_images.dart';
import 'package:alasfor/core/constants/app_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../constants/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? leading;
  final List<Widget>? actions;
  final Widget? child;
  final bool centerTitle;
  final bool showNotification;
  final bool showProfileAvatar;

  const CustomAppBar({
    super.key,
    this.title,
    this.leading,
    this.actions,
    this.child,
    this.centerTitle = true,
    this.showNotification = true,
    this.showProfileAvatar = true,
  });

  // ارتفاع أساسي للـ AppBar (الجزء العلوي فقط)
  static const double _baseHeight = 140;

  // ارتفاع تقريبي للـ child
  static const double _childHeight = 170;

  @override
  Size get preferredSize {
    return Size.fromHeight(
      _baseHeight + (child != null ? _childHeight : _baseHeight),
    );
  }

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final totalHeight = preferredSize.height + statusBarHeight;

    return Stack(
      clipBehavior: Clip.none, // مهم جداً
      children: [
        // الخلفية المنحنية
        ClipPath(
          clipper: HeaderCurveClipper(),
          child: Container(
            height: totalHeight,
            decoration: const BoxDecoration(
              gradient: AppColors.primaryGradient,
            ),
            child: Padding(
              padding: EdgeInsets.only(
                top: statusBarHeight + 8,
                left: 16,
                right: 16,
                bottom: 60, // نقصنا البوتوم لأن البانر سيخرج
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (leading != null)
                        leading!
                      else if (showProfileAvatar)
                        CircleAvatar(
                          radius: 22,
                          backgroundImage: AssetImage(AppImages.person),
                        )
                      else
                        const SizedBox(width: 40),

                      Expanded(
                        child: Center(
                          child: title != null
                              ? AppText.custom(
                                  title!,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.white,
                                )
                              : Image.asset(AppImages.logo, height: 32),
                        ),
                      ),

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

                  if (child != null) ...[const SizedBox(height: 16), child!],
                ],
              ),
            ),
          ),
        ),

        Positioned(bottom: 15, left: 16, right: 16, child: _buildPromoBanner()),
      ],
    );
  }

  Widget _buildPromoBanner() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xFFFDB913), Color(0xFFF9E79F)],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    SizedBox(width: 16),
                    Expanded(
                      child: AppText.medium(
                        'اختاروا الجودة... واختاروا حبّة بتحكوا عنها!',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const SizedBox(width: 16),
                    Icon(
                      Icons.shopping_cart_outlined,
                      color: AppColors.redExtraDeep,
                    ),
                    const SizedBox(width: 6),
                    const AppText.body(
                      'عرض تفاصيل المنتج',
                      maxLines: 2,
                      color: AppColors.redExtraDeep,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: 120,
            decoration: const BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(100),
                bottomRight: Radius.circular(100),
              ),
            ),
            child: Image.asset(AppImages.camolino, fit: BoxFit.fill),
          ),
        ],
      ),
    );
  }
}

class HeaderCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
      size.width * 0.23,
      size.height - 108,
      size.width * 0.6,
      size.height - 108,
    );
    path.quadraticBezierTo(
      size.width * 0.89,
      size.height - 107,
      size.width,
      size.height - 145,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
