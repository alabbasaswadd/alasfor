import 'package:json_annotation/json_annotation.dart';

part 'content_sliderbar_response_model.g.dart';

@JsonSerializable()
class ContentSliderbarResponseModel {
  final bool success;
  final dynamic data;

  ContentSliderbarResponseModel({required this.success, required this.data});
  factory ContentSliderbarResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ContentSliderbarResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContentSliderbarResponseModelToJson(this);
}
