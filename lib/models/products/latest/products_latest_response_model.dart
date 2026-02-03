import 'package:json_annotation/json_annotation.dart';

part 'products_latest_response_model.g.dart';

@JsonSerializable()
class ProductsLatestResponseModel {
  final bool success;
  final dynamic data;

  ProductsLatestResponseModel({required this.success, required this.data});
  factory ProductsLatestResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProductsLatestResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsLatestResponseModelToJson(this);
}
