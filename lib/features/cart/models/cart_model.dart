import 'package:json_annotation/json_annotation.dart';

import 'package:ecommerce_task/features/cart/cart.dart';

part 'cart_model.g.dart';

@JsonSerializable()
class CartModel {
  final List<CartItemModel> cartItems;
  final int totalPrice;
  final int totalDiscount;
  final double discountPercentage;
  CartModel(
    this.cartItems,
    this.totalPrice,
    this.totalDiscount,
    this.discountPercentage,
  );

  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);
  Map<String, dynamic> toJson() => _$CartModelToJson(this);
}
