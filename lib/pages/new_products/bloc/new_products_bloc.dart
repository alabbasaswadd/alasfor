import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:alasfor/core/bloc/bloc_exports.dart';
import 'package:alasfor/pages/new_products/api/new_products_api.dart';
import 'package:alasfor/pages/new_products/model/products_model.dart';
import 'new_products_event.dart';
import 'new_products_state.dart';

class NewProductsBloc extends BaseBloc<NewProductsEvent, NewProductsState> {
  final NewProductsApi _api;

  NewProductsBloc({NewProductsApi? api})
      : _api = api ?? NewProductsApi(),
        super(const NewProductsState()) {
    on<GetNewProductsEvent>(_getNewProducts);
  }

  Future<void> _getNewProducts(
    GetNewProductsEvent event,
    Emitter<NewProductsState> emit,
  ) async {
    await handleApiCall<List<ProductsModel>>(
      emit: emit,
      apiCall: () => _api.getNewProducts(),
      loadingState: () => state.copyWith(
        isLoading: true,
        isError: false,
        isSuccess: false,
      ),
      successState: (products) => state.copyWith(
        isLoading: false,
        isSuccess: true,
        products: products,
      ),
      errorState: (error) => state.copyWith(
        isLoading: false,
        isError: true,
        errorMessage: error,
      ),
      dataParser: (data) => (data as List)
          .map((json) => ProductsModel.fromJson(json))
          .toList(),
      defaultErrorMessage: 'فشل تحميل المنتجات',
    );
  }
}
