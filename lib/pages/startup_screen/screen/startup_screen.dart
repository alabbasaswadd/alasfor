import 'package:alasfor/core/constants/app_colors.dart';
import 'package:alasfor/core/constants/app_images.dart';
import 'package:alasfor/main.dart';
import 'package:alasfor/pages/startup_screen/bloc/startup_bloc.dart';
import 'package:alasfor/pages/startup_screen/bloc/startup_event.dart';
import 'package:alasfor/pages/startup_screen/bloc/startup_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

/// Startup/Splash screen that shows when the app launches.
///
/// This screen displays the app logo and then navigates to either:
/// - Onboarding screen (if user hasn't seen it before)
/// - Main screen (if onboarding was already completed)
class StartupScreen extends StatefulWidget {
  const StartupScreen({super.key});
  static const String id = '/startup';

  @override
  State<StartupScreen> createState() => _StartupScreenState();
}

class _StartupScreenState extends State<StartupScreen>
    with SingleTickerProviderStateMixin {
  late StartupBloc _bloc;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _bloc = StartupBloc();
    _bloc.add(const InitStartupEvent());
  }

  void _setupAnimations() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOutBack),
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: BlocListener<StartupBloc, StartupState>(
        listener: (context, state) {
          if (state.navigationTarget == StartupNavigationTarget.main) {
            navigatorKey.currentContext?.go('/main');
          } else if (state.navigationTarget ==
              StartupNavigationTarget.onboarding) {
            navigatorKey.currentContext?.go('/onboarding');
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.primary,
          body: Center(
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return FadeTransition(
                  opacity: _fadeAnimation,
                  child: ScaleTransition(
                    scale: _scaleAnimation,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Logo
                        Image.asset(
                          AppImages.logo,
                          width: 200,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(height: 24),
                        // Loading indicator
                        const SizedBox(
                          width: 32,
                          height: 32,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              AppColors.secondary,
                            ),
                            strokeWidth: 3,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
