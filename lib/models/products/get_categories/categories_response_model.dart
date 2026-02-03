import 'package:json_annotation/json_annotation.dart';

part 'categories_response_model.g.dart';

@JsonSerializable()
class CategoriesResponseModel {
  final bool success;
  final dynamic data;

  CategoriesResponseModel({required this.success, required this.data});
  factory CategoriesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CategoriesResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesResponseModelToJson(this);
}
