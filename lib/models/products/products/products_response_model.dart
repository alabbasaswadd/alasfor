import 'package:json_annotation/json_annotation.dart';

part 'products_response_model.g.dart';

@JsonSerializable()
class ProductsResponseModel {
  final bool success;
  final dynamic data;
  final dynamic pagination;

  ProductsResponseModel({
    required this.success,
    required this.data,
    required this.pagination,
  });
  factory ProductsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProductsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsResponseModelToJson(this);
}
