import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_state.freezed.dart';

@freezed
abstract class MainState with _$MainState {
  const factory MainState({
    @Default(3) int currentIndex,
    @Default(false) bool isHomeTab,
    @Default(true) bool isNewProductsTab,
  }) = _MainState;
}
