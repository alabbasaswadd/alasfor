import 'package:freezed_annotation/freezed_annotation.dart';

part 'startup_state.freezed.dart';

enum StartupNavigationTarget { none, main, onboarding }

@freezed
abstract class StartupState with _$StartupState {
  const factory StartupState({
    @Default(false) bool isLoading,
    @Default(false) bool isAnimationComplete,
    @Default(false) bool isOnboardingCompleted,
    @Default(StartupNavigationTarget.none) StartupNavigationTarget navigationTarget,
  }) = _StartupState;
}
