// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeProductModel _$HomeProductModelFromJson(Map<String, dynamic> json) =>
    HomeProductModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
      price: (json['price'] as num?)?.toDouble(),
      isFavorite: json['isFavorite'] as bool? ?? false,
    );

Map<String, dynamic> _$HomeProductModelToJson(HomeProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'price': instance.price,
      'isFavorite': instance.isFavorite,
    };
