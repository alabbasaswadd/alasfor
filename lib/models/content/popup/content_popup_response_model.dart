import 'package:json_annotation/json_annotation.dart';

part 'content_popup_response_model.g.dart';

@JsonSerializable()
class ContentPopupResponseModel {
  final bool success;
  final dynamic data;

  ContentPopupResponseModel({required this.success, required this.data});
  factory ContentPopupResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ContentPopupResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContentPopupResponseModelToJson(this);
}
