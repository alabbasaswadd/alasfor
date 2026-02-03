import 'package:json_annotation/json_annotation.dart';

part 'contest_winners_response_model.g.dart';

@JsonSerializable()
class ContestWinnersResponseModel {
  final bool success;
  final dynamic data;

  ContestWinnersResponseModel({required this.success, required this.data});
  factory ContestWinnersResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ContestWinnersResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContestWinnersResponseModelToJson(this);
}
