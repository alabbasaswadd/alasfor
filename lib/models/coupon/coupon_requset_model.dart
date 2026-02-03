import 'package:json_annotation/json_annotation.dart';

part 'coupon_requset_model.g.dart';

@JsonSerializable()
class CouponRequestModel {
  final String code;

  CouponRequestModel({required this.code});
  factory CouponRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CouponRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$CouponRequestModelToJson(this);
}
