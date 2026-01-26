import 'package:alasfor/core/constants/app_colors.dart';
import 'package:alasfor/core/constants/app_images.dart';
import 'package:alasfor/core/constants/app_text.dart';
import 'package:alasfor/main.dart';
import 'package:alasfor/pages/onboarding/bloc/onboarding_bloc.dart';
import 'package:alasfor/pages/onboarding/bloc/onboarding_event.dart';
import 'package:alasfor/pages/onboarding/bloc/onboarding_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  static const String id = '/onboarding';

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late OnboardingBloc _bloc;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _bloc = OnboardingBloc();
    _bloc.add(const InitOnboardingEvent());
  }

  @override
  void dispose() {
    _pageController.dispose();
    _bloc.close();
    super.dispose();
  }

  void _onPageChanged(int index) {
    _bloc.add(PageChangedEvent(index));
  }

  void _nextPage() {
    final state = _bloc.state;
    if (state.currentPage < state.pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
    _bloc.add(const NextPageEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: BlocConsumer<OnboardingBloc, OnboardingState>(
        listener: (context, state) {
          if (state.shouldNavigateToMain) {
            navigatorKey.currentContext?.go('/main');
          }
        },
        builder: (context, state) {
          if (state.pages.isEmpty) {
            return const Scaffold(
              backgroundColor: AppColors.primary,
              body: Center(child: CircularProgressIndicator()),
            );
          }

          return Scaffold(
            body: Stack(
              children: [
                // Background Design
                CustomPaint(
                  size: Size(
                    MediaQuery.of(context).size.width,
                    MediaQuery.of(context).size.height,
                  ),
                  painter: OnboardingBackgroundPainter(),
                ),
                // Content
                SafeArea(
                  child: Column(
                    children: [
                      const SizedBox(height: 16),
                      // Logo
                      Image.asset(AppImages.logo),
                      // PageView
                      Expanded(
                        child: PageView.builder(
                          controller: _pageController,
                          onPageChanged: _onPageChanged,
                          itemCount: state.pages.length,
                          itemBuilder: (context, index) {
                            return OnboardingPage(
                              content: state.pages[index],
                              pageIndex: index,
                            );
                          },
                        ),
                      ),
                      // Page Indicators
                      _buildPageIndicators(state),
                      const SizedBox(height: 24),
                      // Start Button
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32.0),
                        child: _buildStartButton(state),
                      ),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildPageIndicators(OnboardingState state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        state.pages.length,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: state.currentPage == index ? 24 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: state.currentPage == index
                ? AppColors.white
                : AppColors.white.withOpacity(0.4),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }

  Widget _buildStartButton(OnboardingState state) {
    final isLastPage = state.currentPage == state.pages.length - 1;

    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: state.isLoading ? null : _nextPage,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.darkGray,
          foregroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
          elevation: 0,
        ),
        child: state.isLoading
            ? const CircularProgressIndicator(color: AppColors.white)
            : AppText.custom(
                isLastPage ? 'ابدأ الآن' : 'التالي',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final OnboardingContent content;
  final int pageIndex;

  const OnboardingPage({
    super.key,
    required this.content,
    required this.pageIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Product Cards Display
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Main Card (Center)
              Positioned(
                top: 40,
                child: _buildProductCard(rotation: -0.5, scale: 1.0, zIndex: 3),
              ),
              // Right Card
              Positioned(
                right: -110,
                top: -50,
                child: _buildProductCard(rotation: 0.2, scale: 0.5, zIndex: 4),
              ),
              // Left Card
              Positioned(
                left: -120,
                top: 100,
                child: _buildProductCard(rotation: -0.8, scale: 0.7, zIndex: 1),
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),
        // Text Content
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            children: [
              AppText.large(
                content.title,
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                color: AppColors.white,
                height: 1.4,
              ),
              const SizedBox(height: 16),
              AppText.medium(content.subtitle, color: AppColors.white),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProductCard({
    required double rotation,
    required double scale,
    required int zIndex,
  }) {
    return Transform.scale(
      scale: scale,
      child: Transform.rotate(
        angle: rotation,
        child: Container(
          width: 200,
          height: 240,
          decoration: BoxDecoration(
            color: AppColors.lightGray,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [Center(child: Image.asset(AppImages.rice))],
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 40,
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OnboardingBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    // Red background
    paint.color = AppColors.primary;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);

    // Top left curve
    paint.color = AppColors.redDark;
    final path1 = Path();
    path1.moveTo(0, 0);
    path1.quadraticBezierTo(
      size.width * 0.3,
      size.height * 0.15,
      size.width * 0.5,
      size.height * 0.12,
    );
    path1.lineTo(0, size.height * 0.15);
    path1.close();
    canvas.drawPath(path1, paint);

    // Large red circle (top right)
    paint.color = AppColors.redDark;
    canvas.drawCircle(
      Offset(size.width * 0.85, size.height * 0.15),
      size.width * 0.4,
      paint,
    );

    // Yellow area (middle)
    paint.color = AppColors.secondary;
    final path2 = Path();
    path2.moveTo(0, size.height * 0.3);
    path2.quadraticBezierTo(
      size.width * 0.3,
      size.height * 0.4,
      size.width,
      size.height * 0.35,
    );
    path2.lineTo(size.width, size.height * 0.65);
    path2.quadraticBezierTo(
      size.width * 0.7,
      size.height * 0.6,
      0,
      size.height * 0.7,
    );
    path2.close();
    canvas.drawPath(path2, paint);

    // Bottom red circles
    paint.color = AppColors.redDark;
    canvas.drawCircle(
      Offset(size.width * 0.3, size.height * 0.85),
      size.width * 0.35,
      paint,
    );

    // White curve overlay
    paint.color = AppColors.white.withOpacity(0.1);
    final path3 = Path();
    path3.moveTo(0, size.height * 0.25);
    path3.quadraticBezierTo(
      size.width * 0.5,
      size.height * 0.35,
      size.width,
      size.height * 0.3,
    );
    path3.lineTo(size.width, size.height * 0.35);
    path3.quadraticBezierTo(
      size.width * 0.5,
      size.height * 0.4,
      0,
      size.height * 0.3,
    );
    path3.close();
    canvas.drawPath(path3, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
