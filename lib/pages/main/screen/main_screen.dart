import 'package:alasfor/core/constants/app_colors.dart';
import 'package:alasfor/core/widgets/custom_bottom_navigation_bar.dart';
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
    bloc.add(const InitMainEvent());
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

          body: Stack(
            children: [
              // Custom AppBar with wave pattern
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: _buildCustomAppBar(context),
              ),

              // Page content
              Positioned.fill(top: 200, child: bloc.pages[state.currentIndex]),

              // Bottom navigation
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: CustomBottomNavigationBar(
                  currentIndex: state.currentIndex,
                  onTap: (index) {
                    bloc.add(ChangeTabEvent(index));
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCustomAppBar(BuildContext context) {
    return SizedBox(
      height: 220,
      child: Stack(
        children: [
          // Wave background
          CustomPaint(
            painter: WaveAppBarPainter(),
            child: const SizedBox(width: double.infinity, height: 220),
          ),

          // AppBar content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                children: [
                  // Top row: Notification - Logo - Profile
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Notifications icon (left)
                      _buildNotificationButton(),

                      // Logo in pill container (center)
                      _buildLogoPill(),

                      // Profile picture (right)
                      _buildProfileAvatar(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
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
          const Text(
            'الأصفر',
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
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
