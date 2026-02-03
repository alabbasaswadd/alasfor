import 'package:alasfor/pages/new_products/bloc/product/product_event.dart';
import 'package:alasfor/pages/new_products/bloc/product/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductState()) {
    on<FetchProductEvent>(_onFetchProduct);
  }

  Future<void> _onFetchProduct(
    FetchProductEvent event,
    Emitter<ProductState> emit,
  ) async {
    emit(ProductState(isLoading: true));
    try {
      // TODO: Fetch product from repository
      emit(ProductState(isSuccess: true, errorMessage: ''));
    } catch (e) {
      emit(ProductState(isError: true, errorMessage: e.toString()));
    }
  }
}
