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

class BannerModel {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final String? actionUrl;
  final double? rating;

  const BannerModel({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    this.actionUrl,
    this.rating,
  });

  // Mock data for testing
  static List<BannerModel> getMockBanners() {
    return [
      BannerModel(
        id: '1',
        title: 'جمعة مباركة',
        description: '(إن أفضل أيامكم يوم الجمعة، فأكثروا علي من الصلاة فيه، فإن صلاتكم معروضة علي)',
        imageUrl: AppImages.jomaa,
        rating: 4.8,
      ),
      BannerModel(
        id: '2',
        title: 'مع بداية عام 2026',
        description: 'تتقدم أسرة العصفور بأصدق التهاني والتمنيات لكم، سائلين الله أن يكون عاما مليئا بالخير، والتفاؤل',
        imageUrl: AppImages.year,
        rating: 4.5,
      ),
    ];
  }
}

class HomeProductModel {
  final String id;
  final String name;
  final String imageUrl;
  final double? price;
  final bool isFavorite;

  const HomeProductModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.price,
    this.isFavorite = false,
  });

  HomeProductModel copyWith({
    String? id,
    String? name,
    String? imageUrl,
    double? price,
    bool? isFavorite,
  }) {
    return HomeProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  // Mock data for testing
  static List<HomeProductModel> getMockProducts() {
    return [
      HomeProductModel(
        id: '1',
        name: 'موراللا',
        imageUrl: AppImages.camolino2,
        isFavorite: true,
      ),
      HomeProductModel(
        id: '2',
        name: 'راڤيولي بالسبانخ',
        imageUrl: AppImages.camolino2,
        isFavorite: false,
      ),
      HomeProductModel(
        id: '3',
        name: 'لازانيا',
        imageUrl: AppImages.camolino2,
        isFavorite: true,
      ),
    ];
  }
}
