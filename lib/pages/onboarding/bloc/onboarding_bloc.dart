import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:alasfor/core/bloc/bloc_exports.dart';
import 'package:alasfor/core/services/onboarding_service.dart';
import 'onboarding_event.dart';
import 'onboarding_state.dart';

class OnboardingBloc extends BaseBloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(const OnboardingState()) {
    on<InitOnboardingEvent>(_init);
    on<NextPageEvent>(_nextPage);
    on<PageChangedEvent>(_pageChanged);
    on<SkipOnboardingEvent>(_skipOnboarding);
    on<CompleteOnboardingEvent>(_completeOnboarding);
  }
          List<Color> rightRed = [
            Color(0xFFE31118),
            Color(0xFFE31118),
            Color(0xFFE31118),
            Color(0xFFD41318),
            Color(0xFFC21617),
            Color(0xFFB11C20),
          ];
    
           List<Color> leftRed = [
            Color(0xFFE31118),
            Color(0xFFE51118),
            Color(0xFFE81118),
          ];
    
           List<Color> bottomRed = [
            Color(0xFFDA1318),
            Color(0xFFD61318),
            Color(0xFFD21318),
          ];
    
           List<Color> finalYellow = [
            Color(0xFFFFD54F),
            Color(0xFFFFD54F),
            Color(0xFFFFD54F),
          ];
    
  Future<void> _init(
    InitOnboardingEvent event,
    Emitter<OnboardingState> emit,
  ) async {
    final pages = OnboardingContent.getPages();
    emit(
      state.copyWith(
        pages: pages,
        currentPage: 0,
        isCompleted: false,
        shouldNavigateToMain: false,
      ),
    );
  }

  Future<void> _nextPage(
    NextPageEvent event,
    Emitter<OnboardingState> emit,
  ) async {
    if (state.currentPage < state.pages.length - 1) {
      // Move to next page
      emit(state.copyWith(currentPage: state.currentPage + 1));
    } else {
      // Complete onboarding
      add(const CompleteOnboardingEvent());
    }
  }

  Future<void> _pageChanged(
    PageChangedEvent event,
    Emitter<OnboardingState> emit,
  ) async {
    emit(state.copyWith(currentPage: event.pageIndex));
  }

  Future<void> _skipOnboarding(
    SkipOnboardingEvent event,
    Emitter<OnboardingState> emit,
  ) async {
    add(const CompleteOnboardingEvent());
  }

  Future<void> _completeOnboarding(
    CompleteOnboardingEvent event,
    Emitter<OnboardingState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    try {
      await OnboardingService.setOnboardingCompleted();
      emit(
        state.copyWith(
          isLoading: false,
          isCompleted: true,
          shouldNavigateToMain: true,
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false));
      showErrorSnackBar('حدث خطأ أثناء حفظ البيانات');
    }
  }

  bool get isLastPage => state.currentPage == state.pages.length - 1;
}
