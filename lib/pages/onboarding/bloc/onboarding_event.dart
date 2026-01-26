import 'package:alasfor/core/bloc/bloc_exports.dart';

abstract class OnboardingEvent extends BaseEvent {
  const OnboardingEvent();
}

class InitOnboardingEvent extends OnboardingEvent {
  const InitOnboardingEvent();
}

class NextPageEvent extends OnboardingEvent {
  const NextPageEvent();
}

class PageChangedEvent extends OnboardingEvent {
  final int pageIndex;
  const PageChangedEvent(this.pageIndex);
}

class SkipOnboardingEvent extends OnboardingEvent {
  const SkipOnboardingEvent();
}

class CompleteOnboardingEvent extends OnboardingEvent {
  const CompleteOnboardingEvent();
}
