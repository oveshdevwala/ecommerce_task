// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartModel _$CartModelFromJson(Map<String, dynamic> json) => CartModel(
      (json['cartItems'] as List<dynamic>)
          .map((e) => CartItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['totalPrice'] as num).toInt(),
      (json['totalDiscount'] as num).toInt(),
      (json['discountPercentage'] as num).toDouble(),
    );

Map<String, dynamic> _$CartModelToJson(CartModel instance) => <String, dynamic>{
      'cartItems': instance.cartItems,
      'totalPrice': instance.totalPrice,
      'totalDiscount': instance.totalDiscount,
      'discountPercentage': instance.discountPercentage,
    };
