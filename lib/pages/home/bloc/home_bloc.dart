import 'package:alasfor/core/constants/app_images.dart';
import 'package:alasfor/pages/home/model/banner_model.dart';
import 'package:alasfor/pages/home/model/home_product_model.dart';
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
      final banners = getMockBanners();

      emit(state.copyWith(isLoading: false, isSuccess: true, banners: banners));
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

  Future<void> _getProducts(
    GetHomeProductsEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, isError: false));

    try {
      // TODO: Replace with actual API call when ready
      await Future.delayed(const Duration(milliseconds: 300));
      final products = getMockProducts();

      emit(
        state.copyWith(isLoading: false, isSuccess: true, products: products),
      );
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
          .where(
            (product) =>
                product.name.toLowerCase().contains(event.query.toLowerCase()),
          )
          .toList();

      emit(state.copyWith(searchResults: results));
    });
  }

  // Mock data for testing
  static List<BannerModel> getMockBanners() {
    return [
      BannerModel(
        id: '1',
        title: 'جمعة مباركة',
        description:
            '(إن أفضل أيامكم يوم الجمعة، فأكثروا علي من الصلاة فيه، فإن صلاتكم معروضة علي)',
        imageUrl: AppImages.jomaa,
        rating: 4.8,
      ),
      BannerModel(
        id: '2',
        title: 'مع بداية عام 2026',
        description:
            'تتقدم أسرة العصفور بأصدق التهاني والتمنيات لكم، سائلين الله أن يكون عاما مليئا بالخير، والتفاؤل',
        imageUrl: AppImages.year,
        rating: 4.5,
      ),
    ];
  }
}

// Mock data for testing
List<HomeProductModel> getMockProducts() {
  return [
    HomeProductModel(
      id: '1',
      name: 'رز أسباني',
      description: 'لما يكون الأكل طيب أكيد الأكل من عند العصفور',
      imageUrl: AppImages.camolino2,
      isFavorite: true,
    ),
    HomeProductModel(
      id: '2',
      name: 'حلاوة بالفستق',
      description: 'تمتع بنكهة مميزة ورائعة مع حلاوة العصفور',
      imageUrl: AppImages.halawa,
      isFavorite: false,
    ),
    HomeProductModel(
      id: '3',
      name: 'بقوليات العصفور',
      description: 'الطعم الأصيل من المكان الأصيل',
      imageUrl: AppImages.legumes,
      isFavorite: true,
    ),
  ];
}
