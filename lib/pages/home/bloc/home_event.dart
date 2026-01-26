import 'package:alasfor/core/bloc/bloc_exports.dart';

abstract class HomeEvent extends BaseEvent {
  const HomeEvent();
}

class GetHomeBannersEvent extends HomeEvent {
  const GetHomeBannersEvent();
}

class GetHomeProductsEvent extends HomeEvent {
  const GetHomeProductsEvent();
}

class RefreshHomeEvent extends HomeEvent {
  const RefreshHomeEvent();
}

class SearchProductsEvent extends HomeEvent {
  final String query;
  const SearchProductsEvent(this.query);
}

class ToggleFavoriteEvent extends HomeEvent {
  final String productId;
  const ToggleFavoriteEvent(this.productId);
}
