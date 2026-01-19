import 'package:alasfor/pages/new_products/model/products_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_products_state.freezed.dart';

@freezed
abstract class NewProductsState with _$NewProductsState {
  const factory NewProductsState({
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    @Default(false) bool isError,
    @Default('') String errorMessage,
    @Default([]) List<ProductsModel> products,
  }) = _NewProductsState;
}
