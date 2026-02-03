import 'package:json_annotation/json_annotation.dart';

part 'delete_account_response_model.g.dart';

@JsonSerializable()
class DeleteAccountResponseModel {
  final bool success;
  final String message;
  final dynamic data;

  DeleteAccountResponseModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory DeleteAccountResponseModel.fromJson(Map<String, dynamic> json) =>
      _$DeleteAccountResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteAccountResponseModelToJson(this);
}
