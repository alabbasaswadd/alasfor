import 'package:json_annotation/json_annotation.dart';

part 'content_banners_response_model.g.dart';

@JsonSerializable()
class ContentBannersResponseModel {
  final bool success;
  final dynamic data;

  ContentBannersResponseModel({required this.success, required this.data});
  factory ContentBannersResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ContentBannersResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContentBannersResponseModelToJson(this);
}
