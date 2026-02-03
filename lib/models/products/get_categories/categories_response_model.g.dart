// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoriesResponseModel _$CategoriesResponseModelFromJson(
  Map<String, dynamic> json,
) => CategoriesResponseModel(
  success: json['success'] as bool,
  data: json['data'],
);

Map<String, dynamic> _$CategoriesResponseModelToJson(
  CategoriesResponseModel instance,
) => <String, dynamic>{'success': instance.success, 'data': instance.data};
