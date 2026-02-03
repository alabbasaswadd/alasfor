// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequestModel _$RegisterRequestModelFromJson(
  Map<String, dynamic> json,
) => RegisterRequestModel(
  name: json['name'] as String?,
  phone: json['phone'] as String?,
  password: json['password'] as String?,
  passwordConfirmation: json['password_confirmation'] as String?,
);

Map<String, dynamic> _$RegisterRequestModelToJson(
  RegisterRequestModel instance,
) => <String, dynamic>{
  'name': instance.name,
  'phone': instance.phone,
  'password': instance.password,
  'password_confirmation': instance.passwordConfirmation,
};
