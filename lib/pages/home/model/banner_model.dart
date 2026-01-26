import 'package:json_annotation/json_annotation.dart';

part 'banner_model.g.dart';

@JsonSerializable()
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

  factory BannerModel.fromJson(Map<String, dynamic> json) =>
      _$BannerModelFromJson(json);

  Map<String, dynamic> toJson() => _$BannerModelToJson(this);
}
