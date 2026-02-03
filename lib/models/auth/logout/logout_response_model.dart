import 'package:json_annotation/json_annotation.dart';

part 'logout_response_model.g.dart';

@JsonSerializable()
class LogoutResponseModel {
  final bool success;
  final String message;
  final dynamic data;

  LogoutResponseModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory LogoutResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LogoutResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$LogoutResponseModelToJson(this);
}
