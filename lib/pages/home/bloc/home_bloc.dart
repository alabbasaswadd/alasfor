import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:alasfor/core/bloc/bloc_exports.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends BaseBloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<GetHomeBannersEvent>(_getBanners);
    on<GetHomeProductsEvent>(_getProducts);
    on<RefreshHomeEvent>(_refreshHome);
    on<SearchProductsEvent>(_searchProducts);
    on<ToggleFavoriteEvent>(_toggleFavorite);
  }

  Future<void> _getBanners(
    GetHomeBannersEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, isError: false));

    try {
      // TODO: Replace with actual API call when ready
      // await handleApiCall<List<BannerModel>>(
      //   emit: emit,
      //   apiCall: () => _api.getBanners(),
      //   loadingState: () => state.copyWith(isLoading: true),
      //   successState: (banners) => state.copyWith(
      //     isLoading: false,
      //     isSuccess: true,
      //     banners: banners,
      //   ),
      //   errorState: (error) => state.copyWith(
      //     isLoading: false,
      //     isError: true,
      //     errorMessage: error,
      //   ),
      //   defaultErrorMessage: 'فشل تحميل البانرات',
      // );

      // Using mock data for now
      await Future.delayed(const Duration(milliseconds: 300));
      final banners = BannerModel.getMockBanners();

      emit(state.copyWith(
        isLoading: false,
        isSuccess: true,
        banners: banners,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        isError: true,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _getProducts(
    GetHomeProductsEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, isError: false));

    try {
      // TODO: Replace with actual API call when ready
      await Future.delayed(const Duration(milliseconds: 300));
      final products = HomeProductModel.getMockProducts();

      emit(state.copyWith(
        isLoading: false,
        isSuccess: true,
        products: products,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        isError: true,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _refreshHome(
    RefreshHomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    add(const GetHomeBannersEvent());
    add(const GetHomeProductsEvent());
  }

  Future<void> _searchProducts(
    SearchProductsEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(searchQuery: event.query));

    if (event.query.isEmpty) {
      emit(state.copyWith(searchResults: []));
      return;
    }

    // Filter products based on search query
    debounce('search', () {
      final results = state.products
          .where((product) =>
              product.name.toLowerCase().contains(event.query.toLowerCase()))
          .toList();

      emit(state.copyWith(searchResults: results));
    });
  }

  Future<void> _toggleFavorite(
    ToggleFavoriteEvent event,
    Emitter<HomeState> emit,
  ) async {
    final updatedProducts = state.products.map((product) {
      if (product.id == event.productId) {
        return product.copyWith(isFavorite: !product.isFavorite);
      }
      return product;
    }).toList();

    emit(state.copyWith(products: updatedProducts));

    // TODO: Sync with API
  }
}
