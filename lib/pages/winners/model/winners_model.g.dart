// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'winners_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WinnerModel _$WinnerModelFromJson(Map<String, dynamic> json) => WinnerModel(
  id: json['id'] as String,
  name: json['name'] as String,
  prize: json['prize'] as String,
  date: json['date'] as String,
  imageUrl: json['image_url'] as String,
);

Map<String, dynamic> _$WinnerModelToJson(WinnerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'prize': instance.prize,
      'date': instance.date,
      'image_url': instance.imageUrl,
    };
