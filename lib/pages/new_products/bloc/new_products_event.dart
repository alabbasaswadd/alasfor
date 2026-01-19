import 'package:equatable/equatable.dart';

abstract class NewProductsEvent extends Equatable {
  const NewProductsEvent();
}

/// جلب المنتجات الجديدة
class GetNewProductsEvent extends NewProductsEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
