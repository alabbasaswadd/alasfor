import 'package:alasfor/core/bloc/bloc_exports.dart';

abstract class MainEvent extends BaseEvent {
  const MainEvent();
}

class ChangeTabEvent extends MainEvent {
  final int index;
  const ChangeTabEvent(this.index);
}

class InitMainEvent extends MainEvent {
  const InitMainEvent();
}
