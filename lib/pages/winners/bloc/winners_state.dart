import 'package:alasfor/pages/winners/model/winners_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'winners_state.freezed.dart';

@freezed
abstract class WinnersState with _$WinnersState {
  const factory WinnersState({
    @Default(false) bool isLoading,
    @Default(false) bool isLoadingMore,
    @Default(false) bool isSuccess,
    @Default(false) bool isError,
    @Default('') String errorMessage,
    @Default([]) List<WinnerModel> winners,
    @Default(1) int currentPage,
    @Default(false) bool hasReachedMax,
    int? filterMonth,
    int? filterYear,
  }) = _WinnersState;
}
