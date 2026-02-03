import 'package:alasfor/pages/new_products/model/products_model.dart';

class ProductEvent {
  const ProductEvent();
}

class FetchProductEvent extends ProductEvent {
  final String productId;

  const FetchProductEvent(this.productId);
}

class UpdateProductEvent extends ProductEvent {
  final ProductsModel product;

  const UpdateProductEvent(this.product);

  @override
  List<Object?> get props => [product];
}

class DeleteProductEvent extends ProductEvent {
  final String productId;

  const DeleteProductEvent(this.productId);

  @override
  List<Object?> get props => [productId];
}
