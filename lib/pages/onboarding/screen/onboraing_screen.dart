import 'package:alasfor/core/constants/app_colors.dart';
import 'package:alasfor/core/constants/app_images.dart';
import 'package:alasfor/core/constants/app_text.dart';
import 'package:alasfor/pages/main/screen/main_screen.dart';
import 'package:alasfor/pages/onboarding/bloc/onboarding_bloc.dart';
import 'package:alasfor/pages/onboarding/bloc/onboarding_event.dart';
import 'package:alasfor/pages/onboarding/bloc/onboarding_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  static String id = "/onboarding";

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final OnboardingBloc bloc;
  late final PageController pageController;

  @override
  void initState() {
    super.initState();
    bloc = OnboardingBloc();
    pageController = PageController();
    bloc.add(const InitOnboardingEvent());
  }

  @override
  void dispose() {
    bloc.close();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OnboardingBloc, OnboardingState>(
      bloc: bloc,
      listener: (context, state) {
        if (state.shouldNavigateToMain) {
          context.go(MainScreen.id);
        }
      },
      child: BlocBuilder<OnboardingBloc, OnboardingState>(
        bloc: bloc,
        builder: (context, state) {
          final size = MediaQuery.of(context).size;

          // RED COLORS (from mockup)

          return Scaffold(
            body: Stack(
              children: [
                // 1. BASE YELLOW GRADIENT
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: bloc.finalYellow,
                    ),
                  ),
                ),

                // 2. TOP LEFT CURVED SHAPE
                Positioned.fill(
                  child: CustomPaint(
                    painter: TopLeftCurvePainter(bloc.leftRed),
                  ),
                ),

                // 3. TOP RIGHT CURVED SHAPE
                Positioned.fill(
                  child: CustomPaint(
                    painter: TopRightCurvePainter(bloc.rightRed),
                  ),
                ),

                // 4. BOTTOM RED CIRCLE
                Positioned(
                  bottom: -size.height * 0.32,
                  left: -size.width * 0.21,
                  right: -size.width * 0.14,
                  child: Container(
                    width: size.width * 1.50,
                    height: size.width * 1.50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: bloc.bottomRed,
                      ),
                    ),
                  ),
                ),

                // 5. WHITE CIRCULAR LINES (TOP & BOTTOM)
                Positioned.fill(
                  child: CustomPaint(painter: CircleArcPainter()),
                ),

                // 6. LOGO AT TOP
                Positioned(
                  top: size.height * 0.038,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: SizedBox(
                      width: 132,
                      height: 99,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(AppImages.logo, fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),

                // 7. PRODUCT CARDS WITH PAGEVIEW
                _buildProductCardsPageView(size, state),

                // 8. TEXT & ACTION OVERLAY
                _buildOverlay(size, context, state),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildProductCardsPageView(Size size, OnboardingState state) {
    if (state.pages.isEmpty) {
      return _buildProductCards(size, null);
    }

    return PageView.builder(
      controller: pageController,
      itemCount: state.pages.length,
      onPageChanged: (index) {
        bloc.add(PageChangedEvent(index));
      },
      itemBuilder: (context, index) {
        return _buildProductCards(size, state.pages[index]);
      },
    );
  }

  Widget _buildProductCards(Size size, OnboardingContent? content) {
    final imagePath = content?.imagePath ?? AppImages.rice;

    return Stack(
      children: [
        // LEFT CARD (behind, tilted)
        Positioned(
          top: size.height * 0.49,
          left: -size.width * 0.114,
          child: Transform.rotate(
            angle: -0.65,
            child: _productCard(
              width: size.width * 0.22,
              height: size.width * 0.27,
              redBarHeight: 14,
              imagePath: AppImages.tona,
            ),
          ),
        ),

        // RIGHT CARD (behind, tilted)
        Positioned(
          top: size.height * 0.28,
          right: -size.width * 0.114,
          child: Transform.rotate(
            angle: 0.089,
            child: _productCard(
              width: size.width * 0.32,
              height: size.width * 0.365,
              redBarHeight: 19,
              imagePath: AppImages.mushroom,
              padding: 6,
            ),
          ),
        ),

        // CENTER MAIN CARD (front, prominent)
        Positioned(
          top: size.height * 0.345,
          left: (size.width - size.width * 0.575) / 2,
          child: Container(
            width: size.width * 0.575,
            height: size.width * 0.7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.22),
                  blurRadius: 25,
                  offset: const Offset(0, 15),
                  spreadRadius: 8,
                ),
              ],
            ),
            child: Transform.rotate(
              angle: -0.235,
              child: _productCard(
                width: size.width * 0.575,
                height: size.width * 0.7,
                redBarHeight: 34,
                isMain: false,
                imagePath: imagePath,
                padding: 10,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _productCard({
    required double width,
    required double height,
    required double redBarHeight,
    required String imagePath,
    bool isMain = false,
    double padding = 5,
  }) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: const Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 15,
            offset: const Offset(0, 10),
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(10),
                  bottom: Radius.circular(5),
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(10),
                  bottom: Radius.circular(5),
                ),
                child: Image.asset(
                  imagePath,
                  width: double.infinity,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(
                      child: Icon(Icons.image, color: Colors.grey, size: 40),
                    );
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: isMain ? 12 : 8),
          Container(
            height: redBarHeight,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFFD30000),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOverlay(Size size, BuildContext context, OnboardingState state) {
    final currentContent =
        state.pages.isNotEmpty && state.currentPage < state.pages.length
        ? state.pages[state.currentPage]
        : null;

    final title =
        currentContent?.title ?? "من هنا تبدأ رحلتك مع منتجات العصفور.\u200F";
    final subtitle =
        currentContent?.subtitle ?? "جودة نعرفها، ونشاركها معك بكل ثقة.\u200F";
    final isLastPage = state.currentPage == state.pages.length - 1;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 25, left: 31, right: 31),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppText.large(
              title,
              fontWeight: FontWeight.w500,
              textAlign: TextAlign.center,
              color: AppColors.white,
            ),
            const SizedBox(height: 13),
            AppText.medium(
              subtitle,
              textAlign: TextAlign.center,
              color: AppColors.white,
            ),
            const SizedBox(height: 10),
            // Page Indicators
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                state.pages.isEmpty ? 3 : state.pages.length,
                (index) => _dot(index == state.currentPage),
              ),
            ),
            const SizedBox(height: 25),
            GestureDetector(
              onTap: state.isLoading
                  ? null
                  : () {
                      if (isLastPage || state.pages.isEmpty) {
                        bloc.add(const CompleteOnboardingEvent());
                      } else {
                        pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
              child: Container(
                height: 48,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFF0B1211),
                  borderRadius: BorderRadius.circular(29),
                ),
                child: Center(
                  child: state.isLoading
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : AppText.medium(
                          isLastPage || state.pages.isEmpty
                              ? "ابدء الأن"
                              : "التالي",
                          color: AppColors.white,
                        ),
                ),
              ),
            ),
            // Skip button (only show if not on last page)
            if (!isLastPage && state.pages.isNotEmpty) ...[
              const SizedBox(height: 12),
            ],
          ],
        ),
      ),
    );
  }

  Widget _dot(bool active) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        color: active ? Colors.black : Colors.black.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

class CircleArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFFFE5CC)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    final topRect = Rect.fromCircle(
      center: Offset(size.width * 0.52, size.height * 0.024),
      radius: size.width * 0.584,
    );
    canvas.drawArc(topRect, 3.0, -2.5, false, paint);

    final bottomRect = Rect.fromCircle(
      center: Offset(size.width * 0.85, size.height * 1.05),
      radius: size.width * 0.97,
    );
    canvas.drawArc(bottomRect, 3.14, 3.14, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class TopRightCurvePainter extends CustomPainter {
  final List<Color> colors;

  TopRightCurvePainter(this.colors);

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..moveTo(size.width, size.height * 0.14)
      ..cubicTo(
        size.width * 0.93,
        size.height * 0.28,
        size.width * 0.20,
        size.height * 0.35,
        size.width * 0.02,
        0,
      )
      ..lineTo(size.width, 0)
      ..close();

    final paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: colors,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height * 0.4))
      ..style = PaintingStyle.fill;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class TopLeftCurvePainter extends CustomPainter {
  final List<Color> colors;

  TopLeftCurvePainter(this.colors);

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..moveTo(0, size.height * 0.318)
      ..cubicTo(
        size.width * 0.75,
        size.height * 0.525,
        size.width * 1.11,
        size.height * 0.03,
        size.width * 0.99,
        0,
      )
      ..lineTo(0, 0)
      ..close();

    final paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.bottomRight,
        end: Alignment.topLeft,
        colors: colors,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height * 0.5))
      ..style = PaintingStyle.fill;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
