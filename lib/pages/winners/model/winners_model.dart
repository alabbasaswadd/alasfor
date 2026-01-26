import 'package:json_annotation/json_annotation.dart';

part 'winners_model.g.dart';

@JsonSerializable()
class WinnerModel {
  final String id;
  final String name;
  final String prize;
  final String date;
  @JsonKey(name: 'image_url')
  final String imageUrl;

  const WinnerModel({
    required this.id,
    required this.name,
    required this.prize,
    required this.date,
    required this.imageUrl,
  });

  factory WinnerModel.fromJson(Map<String, dynamic> json) =>
      _$WinnerModelFromJson(json);

  Map<String, dynamic> toJson() => _$WinnerModelToJson(this);
}
