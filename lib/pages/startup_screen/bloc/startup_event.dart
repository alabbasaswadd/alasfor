import 'package:alasfor/core/bloc/bloc_exports.dart';

abstract class StartupEvent extends BaseEvent {
  const StartupEvent();
}

class InitStartupEvent extends StartupEvent {
  const InitStartupEvent();
}

class CheckOnboardingStatusEvent extends StartupEvent {
  const CheckOnboardingStatusEvent();
}
