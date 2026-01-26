import 'package:alasfor/pages/home/model/banner_model.dart';
import 'package:alasfor/pages/home/model/home_product_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:alasfor/core/constants/app_images.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default(false) bool isLoading,
    @Default(false) bool isSuccess,
    @Default(false) bool isError,
    @Default('') String errorMessage,
    @Default([]) List<BannerModel> banners,
    @Default([]) List<HomeProductModel> products,
    @Default([]) List<HomeProductModel> searchResults,
    @Default('') String searchQuery,
  }) = _HomeState;
}
