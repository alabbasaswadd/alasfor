import 'package:alasfor/core/bloc/bloc_exports.dart';

abstract class MainEvent extends BaseEvent {
  const MainEvent();
}

class ChangePageEvent extends MainEvent {
  final int index;
  const ChangePageEvent(this.index);
}
