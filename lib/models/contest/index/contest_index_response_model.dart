import 'package:json_annotation/json_annotation.dart';

part 'contest_index_response_model.g.dart';

@JsonSerializable()
class ContestIndexResponseModel {
  final bool success;
  final dynamic data;

  ContestIndexResponseModel({required this.success, required this.data});
  factory ContestIndexResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ContestIndexResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContestIndexResponseModelToJson(this);
}
