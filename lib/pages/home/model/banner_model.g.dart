// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerModel _$BannerModelFromJson(Map<String, dynamic> json) => BannerModel(
  id: json['id'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
  imageUrl: json['imageUrl'] as String,
  actionUrl: json['actionUrl'] as String?,
  rating: (json['rating'] as num?)?.toDouble(),
);

Map<String, dynamic> _$BannerModelToJson(BannerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'actionUrl': instance.actionUrl,
      'rating': instance.rating,
    };
