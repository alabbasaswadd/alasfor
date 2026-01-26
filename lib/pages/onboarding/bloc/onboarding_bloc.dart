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

  Future<void> _init(
    InitOnboardingEvent event,
    Emitter<OnboardingState> emit,
  ) async {
    final pages = OnboardingContent.getPages();
    emit(state.copyWith(
      pages: pages,
      currentPage: 0,
      isCompleted: false,
      shouldNavigateToMain: false,
    ));
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
      emit(state.copyWith(
        isLoading: false,
        isCompleted: true,
        shouldNavigateToMain: true,
      ));
    } catch (e) {
      emit(state.copyWith(isLoading: false));
      showErrorSnackBar('حدث خطأ أثناء حفظ البيانات');
    }
  }

  bool get isLastPage => state.currentPage == state.pages.length - 1;
}
