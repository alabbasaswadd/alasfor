// app_router.dart
import 'package:alasfor/main.dart';
import 'package:alasfor/pages/main/screen/main_screen.dart';
import 'package:alasfor/pages/notifications/screen/notifications_screen.dart';
import 'package:alasfor/pages/onboarding/screen/onboraing_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'pages/startup_screen/screen/startup_screen.dart';

/// Application router configuration.
///
/// Navigation Flow:
/// 1. App starts at '/startup' (Splash Screen)
/// 2. After splash, checks if onboarding was completed:
///    - If NOT completed → Navigate to '/onboarding'
///    - If completed → Navigate to '/main'
/// 3. After completing onboarding → Navigate to '/main'
final GoRouter appRouter = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: StartupScreen.id,
  routes: [
    // Startup/Splash Screen
    GoRoute(
      path: StartupScreen.id,
      name: 'startup',
      builder: (context, state) => const StartupScreen(),
    ),

    // Onboarding Screen (shown only once)
    GoRoute(
      path: OnboardingScreen.id,
      name: 'onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),

    // Main Screen (with custom AppBar and Bottom Navigation)
    GoRoute(
      path: MainScreen.id,
      name: 'main',
      builder: (context, state) => const MainScreen(),
    ),
    GoRoute(
      path: NotificationsScreen.id,
      name: 'notifications',
      builder: (context, state) => const NotificationsScreen(),
      routes: [],
    ),
  ],
);
