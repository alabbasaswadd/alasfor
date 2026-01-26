import 'package:alasfor/core/bloc/bloc_exports.dart';

abstract class WinnersEvent extends BaseEvent {
  const WinnersEvent();
}

class GetWinnersEvent extends WinnersEvent {
  const GetWinnersEvent();
}

class RefreshWinnersEvent extends WinnersEvent {
  const RefreshWinnersEvent();
}

class LoadMoreWinnersEvent extends WinnersEvent {
  const LoadMoreWinnersEvent();
}

class FilterWinnersByMonthEvent extends WinnersEvent {
  final int month;
  final int year;
  const FilterWinnersByMonthEvent({required this.month, required this.year});
}
