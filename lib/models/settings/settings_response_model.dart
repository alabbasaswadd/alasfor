import 'package:json_annotation/json_annotation.dart';

part 'settings_response_model.g.dart';

@JsonSerializable()
class SettingsResponseModel {
  final bool success;
  final dynamic data;

  SettingsResponseModel({required this.success, required this.data});
  factory SettingsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SettingsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SettingsResponseModelToJson(this);
}
