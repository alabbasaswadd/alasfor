import 'package:json_annotation/json_annotation.dart';

part 'coupon_response_model.g.dart';

@JsonSerializable()
class CouponResponseModel {
  final bool success;
  final dynamic data;

  CouponResponseModel({required this.success, required this.data});
  factory CouponResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CouponResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CouponResponseModelToJson(this);
}
