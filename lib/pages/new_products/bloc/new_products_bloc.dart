import 'package:alasfor/core/helper/handle_api.dart';
import 'package:alasfor/pages/new_products/api/new_products_api.dart';
import 'package:alasfor/pages/new_products/model/products_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'new_products_event.dart';
import 'new_products_state.dart';

class NewProductsBloc extends Bloc<NewProductsEvent, NewProductsState> {
  NewProductsBloc() : super(const NewProductsState()) {
    on<GetNewProductsEvent>(_fetchNewProducts);
  }
  NewProductsApi api = NewProductsApi();
  Future<void> _fetchNewProducts(
    GetNewProductsEvent event,
    Emitter<NewProductsState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, isError: false, isSuccess: false));

    try {
      final response = await api.getNewProducts();

      if (HandleApi.isSuccess(response)) {
        final data = response.data['data'] as List;

        final products = data
            .map((json) => ProductsModel.fromJson(json))
            .toList();

        emit(
          state.copyWith(isLoading: false, isSuccess: true, products: products),
        );
      } else {
        final errorMessage = HandleApi.parseErrors(response.data);

        emit(
          state.copyWith(
            isLoading: false,
            isError: true,
            errorMessage: errorMessage,
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          isError: true,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
