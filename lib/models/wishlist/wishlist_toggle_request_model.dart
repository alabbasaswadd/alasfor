import 'package:json_annotation/json_annotation.dart';

part 'wishlist_toggle_request_model.g.dart';

@JsonSerializable()
class WishlistToggleRequestModel {
  @JsonKey(name: 'product_id')
  final int productId;

  WishlistToggleRequestModel({required this.productId});
  factory WishlistToggleRequestModel.fromJson(Map<String, dynamic> json) =>
      _$WishlistToggleRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$WishlistToggleRequestModelToJson(this);
}
