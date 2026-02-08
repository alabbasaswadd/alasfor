import 'package:alasfor/core/constants/app_colors.dart';
import 'package:alasfor/core/constants/app_images.dart';
import 'package:alasfor/core/constants/app_text.dart';
import 'package:alasfor/core/widgets/custom_app_bar.dart';
import 'package:alasfor/core/widgets/custom_bottom_navigation_bar.dart';
import 'package:alasfor/core/widgets/stories_section.dart';
import 'package:alasfor/pages/main/bloc/main_bloc.dart';
import 'package:alasfor/pages/main/bloc/main_event.dart';
import 'package:alasfor/pages/main/bloc/main_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  static const String id = '/main';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late MainBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = MainBloc();
    bloc.add(const ChangePageEvent(2));
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  /// Build page based on current index - loads only when needed

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      bloc: bloc,
      builder: (context, state) {
        return Scaffold(
          extendBody: true,
          backgroundColor: AppColors.white,
          appBar: CustomAppBar(
            child: state.currentIndex == 2
                ? storiesSection()
                : state.currentIndex == 3
                ? _buildSearchBar()
                : null,
          ),
          body: Stack(
            children: [
              // Custom AppBar with wave pattern
              // Positioned.fill(top: 0, left: 0, right: 0, child: CustomAppBar()),
              // Page content
              Positioned.fill(top: 0, child: bloc.pages[state.currentIndex]),

              // Bottom navigation
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: CustomBottomNavigationBar(
                  currentIndex: state.currentIndex,
                  onTap: (index) {
                    bloc.add(ChangePageEvent(index));
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget storiesSection() {
    final stories = [
      StoryData(
        name: 'أفضل العروض',
        imageUrl: AppImages.zattar,
        isActive: true,
      ),
      StoryData(
        name: 'شاهد المسابقة',
        imageUrl: AppImages.halawa,
        isActive: false,
      ),
      StoryData(name: 'عرض حصري', imageUrl: AppImages.tea, isActive: false),
      StoryData(name: 'وصفة شهية', imageUrl: AppImages.tona, isActive: false),
      StoryData(name: 'وصفة شهية', imageUrl: AppImages.dates, isActive: false),
    ];

    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: stories.length,
        itemBuilder: (context, index) {
          return _buildStoryItem(stories[index]);
        },
      ),
    );
  }

  Widget _buildStoryItem(StoryData story) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: story.isActive
                  ? LinearGradient(
                      colors: [AppColors.secondary, AppColors.primary],
                    )
                  : null,
              border: !story.isActive
                  ? Border.all(color: Colors.white.withOpacity(0.5), width: 2)
                  : null,
            ),
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: CircleAvatar(
                radius: 28,
                // backgroundImage: NetworkImage(story.imageUrl),
                child: Image.asset(AppImages.camolino),
              ),
            ),
          ),
          const SizedBox(height: 4),
          SizedBox(
            width: 80,
            child: AppText.small(
              story.name,
              color: AppColors.white,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Column(
      children: [
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: AppColors.secondary,
                          offset: Offset(0, -2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.search, color: Colors.grey[400], size: 22),
                        const SizedBox(width: 12),
                        const AppText.body('ابحث عن منتج'),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [AppColors.secondary, AppColors.goldDark],
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Icon(Icons.tune, color: AppColors.white),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCustomAppBar(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).padding.top;

    return ClipPath(
      clipper: HeaderCurveClipper(),
      child: Container(
        height: 220 + statusBarHeight,
        decoration: const BoxDecoration(gradient: AppColors.primaryGradient),
        child: Padding(
          padding: EdgeInsets.only(
            top: statusBarHeight + 8,
            left: 16,
            right: 16,
          ),
          child: Column(
            children: [
              // Top row: Notification - Logo - Profile
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildNotificationButton(),
                  _buildLogoPill(),
                  _buildProfileAvatar(),
                ],
              ),

              const SizedBox(height: 16),
              // childWidgetHere
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationButton() {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: AppColors.white.withOpacity(0.2),
        shape: BoxShape.circle,
      ),
      child: Stack(
        children: [
          Center(
            child: IconButton(
              onPressed: () {
                // Handle notifications tap
              },
              icon: const Icon(
                Icons.notifications_outlined,
                color: AppColors.white,
                size: 24,
              ),
              padding: EdgeInsets.zero,
            ),
          ),
          // Notification badge
          Positioned(
            top: 8,
            right: 8,
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: AppColors.secondary,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.white, width: 1.5),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPromoBanner() {
    return Stack(
      children: [
        Container(
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
        ),
      ],
    );
  }

  Widget _buildLogoPill() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.15),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // App icon/logo
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradient,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.restaurant_menu,
              color: AppColors.white,
              size: 20,
            ),
          ),
          const SizedBox(width: 10),
          // App name
          const AppText.body('الأصفر', color: AppColors.primary),
        ],
      ),
    );
  }

  Widget _buildProfileAvatar() {
    return GestureDetector(
      onTap: () {
        // Handle profile tap
      },
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.white, width: 2),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.2),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ClipOval(
          child: Container(
            color: AppColors.white,
            child: const Icon(Icons.person, color: AppColors.primary, size: 28),
          ),
        ),
      ),
    );
  }
}

class WaveAppBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Main red gradient paint
    final paint = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [AppColors.redLight, AppColors.redDeep],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill;

    final path = Path();

    // Start from top-left
    path.moveTo(0, 0);

    // Line to top-right
    path.lineTo(size.width, 0);

    // Line down to wave start point (right side)
    path.lineTo(size.width, size.height - 50);

    // First wave curve (right to center)
    path.cubicTo(
      size.width * 0.75,
      size.height - 20, // First control point
      size.width * 0.65,
      size.height - 10, // Second control point
      size.width * 0.5,
      size.height - 30, // End at center
    );

    // Second wave curve (center to left)
    path.cubicTo(
      size.width * 0.35,
      size.height - 50, // First control point
      size.width * 0.25,
      size.height - 60, // Second control point
      0,
      size.height - 40, // End at left
    );

    // Close the path
    path.close();

    canvas.drawPath(path, paint);

    // Draw subtle overlay wave for depth effect
    _drawOverlayWave(canvas, size);
  }

  void _drawOverlayWave(Canvas canvas, Size size) {
    final overlayPaint = Paint()
      ..color = AppColors.white.withOpacity(0.08)
      ..style = PaintingStyle.fill;

    final overlayPath = Path();

    overlayPath.moveTo(0, size.height * 0.4);

    overlayPath.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.35,
      size.width * 0.5,
      size.height * 0.45,
    );

    overlayPath.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.55,
      size.width,
      size.height * 0.5,
    );

    overlayPath.lineTo(size.width, size.height);
    overlayPath.lineTo(0, size.height);
    overlayPath.close();

    canvas.drawPath(overlayPath, overlayPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}




// /// Helper function to build page content
// Widget _buildPageContent({
//   required IconData icon,
//   required String title,
//   required String subtitle,
// }) {
//   return Center(
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Container(
//           width: 120,
//           height: 120,
//           decoration: BoxDecoration(
//             color: AppColors.primary.withOpacity(0.1),
//             shape: BoxShape.circle,
//           ),
//           child: Icon(icon, size: 60, color: AppColors.primary),
//         ),
//         const SizedBox(height: 24),
//         AppText.large(
//           title,
//           color: AppColors.darkGray,
//           textDirection: TextDirection.rtl,
//         ),
//         const SizedBox(height: 8),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 32),
//           child: AppText.medium(
//             subtitle,
//             textAlign: TextAlign.center,
//             color: AppColors.darkGray.withOpacity(0.7),
//             textDirection: TextDirection.rtl,
//           ),
//         ),
//       ],
//     ),
//   );
  
// }
