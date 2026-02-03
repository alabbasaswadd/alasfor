import 'package:json_annotation/json_annotation.dart';

part 'content_all_response_model.g.dart';

@JsonSerializable()
class ContentAllResponseModel {
  final bool success;
  final dynamic data;

  ContentAllResponseModel({required this.success, required this.data});
  factory ContentAllResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ContentAllResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContentAllResponseModelToJson(this);
}
