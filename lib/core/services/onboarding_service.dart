import 'package:shared_preferences/shared_preferences.dart';

/// Service to manage onboarding state persistence.
///
/// This service handles checking and saving whether the user
/// has completed the onboarding flow.
class OnboardingService {
  static const String _onboardingCompletedKey = 'onboarding_completed';

  /// Checks if the onboarding has been completed.
  ///
  /// Returns `true` if the user has already seen the onboarding,
  /// `false` otherwise.
  static Future<bool> isOnboardingCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_onboardingCompletedKey) ?? false;
  }

  /// Marks the onboarding as completed.
  ///
  /// Call this method when the user finishes the onboarding flow.
  static Future<void> setOnboardingCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_onboardingCompletedKey, true);
  }

  /// Resets the onboarding state (for testing purposes).
  ///
  /// This will make the onboarding appear again on next app launch.
  static Future<void> resetOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_onboardingCompletedKey);
  }
}
