import 'package:json_annotation/json_annotation.dart';

import 'package:ecommerce_task/features/product_home/models/model.dart';

part 'cart_item_model.g.dart';

@JsonSerializable()
class CartItemModel {
  final ProductModel product;
  final int unit;

  CartItemModel(
    this.product,
    this.unit,
  );

  factory CartItemModel.fromJson(Map<String, dynamic> json) =>
      _$CartItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$CartItemModelToJson(this);
}
