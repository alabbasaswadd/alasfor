import 'package:json_annotation/json_annotation.dart';

part 'home_product_model.g.dart';

@JsonSerializable()
class HomeProductModel {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final double? price;
  final bool isFavorite;

  const HomeProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    this.price,
    this.isFavorite = false,
  });

  factory HomeProductModel.fromJson(Map<String, dynamic> json) =>
      _$HomeProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$HomeProductModelToJson(this);
}
