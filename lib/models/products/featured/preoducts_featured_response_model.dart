import 'package:json_annotation/json_annotation.dart';

part 'preoducts_featured_response_model.g.dart';

@JsonSerializable()
class ProductsFeaturedResponseModel {
  final bool success;
  final dynamic data;

  ProductsFeaturedResponseModel({required this.success, required this.data});
  factory ProductsFeaturedResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProductsFeaturedResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsFeaturedResponseModelToJson(this);
}
