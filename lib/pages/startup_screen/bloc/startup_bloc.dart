import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:alasfor/core/bloc/bloc_exports.dart';
import 'package:alasfor/core/services/onboarding_service.dart';
import 'startup_event.dart';
import 'startup_state.dart';

class StartupBloc extends BaseBloc<StartupEvent, StartupState> {
  StartupBloc() : super(const StartupState()) {
    on<InitStartupEvent>(_init);
    on<CheckOnboardingStatusEvent>(_checkOnboardingStatus);
  }

  Future<void> _init(
    InitStartupEvent event,
    Emitter<StartupState> emit,
  ) async {
    emit(state.copyWith(
      isLoading: true,
      navigationTarget: StartupNavigationTarget.none,
    ));

    // Wait for splash animation
    await Future.delayed(const Duration(seconds: 2));

    // Check onboarding status
    add(const CheckOnboardingStatusEvent());
  }

  Future<void> _checkOnboardingStatus(
    CheckOnboardingStatusEvent event,
    Emitter<StartupState> emit,
  ) async {
    try {
      final isOnboardingCompleted =
          await OnboardingService.isOnboardingCompleted();

      emit(state.copyWith(
        isLoading: false,
        isAnimationComplete: true,
        isOnboardingCompleted: isOnboardingCompleted,
        navigationTarget: isOnboardingCompleted
            ? StartupNavigationTarget.main
            : StartupNavigationTarget.onboarding,
      ));
    } catch (e) {
      // On error, navigate to onboarding as fallback
      emit(state.copyWith(
        isLoading: false,
        isAnimationComplete: true,
        isOnboardingCompleted: false,
        navigationTarget: StartupNavigationTarget.onboarding,
      ));
    }
  }
}
