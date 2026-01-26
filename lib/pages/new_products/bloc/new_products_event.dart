import 'package:alasfor/core/bloc/bloc_exports.dart';

abstract class NewProductsEvent extends BaseEvent {
  const NewProductsEvent();
}

class GetNewProductsEvent extends NewProductsEvent {}
