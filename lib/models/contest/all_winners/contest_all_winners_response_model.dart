import 'package:json_annotation/json_annotation.dart';

part 'contest_all_winners_response_model.g.dart';

@JsonSerializable()
class ContestAllWinnersResponseModel {
  final bool success;
  final dynamic data;

  ContestAllWinnersResponseModel({required this.success, required this.data});
  factory ContestAllWinnersResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ContestAllWinnersResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContestAllWinnersResponseModelToJson(this);
}
