// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      (json['id'] as num?)?.toInt(),
      json['title'] as String?,
      json['description'] as String?,
      json['category'] as String?,
      (json['price'] as num?)?.toDouble(),
      (json['discountPercentage'] as num?)?.toDouble(),
      (json['rating'] as num?)?.toDouble(),
      (json['stock'] as num?)?.toInt(),
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['brand'] as String?,
      json['sku'] as String,
      (json['weight'] as num?)?.toInt(),
      json['dimensions'] == null
          ? null
          : DimensionsModel.fromJson(
              json['dimensions'] as Map<String, dynamic>),
      json['warrantyInformation'] as String?,
      json['shippingInformation'] as String?,
      json['availabilityStatus'] as String?,
      (json['reviews'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : ReviewModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['returnPolicy'] as String?,
      (json['minimumOrderQuantity'] as num?)?.toInt(),
      json['meta'] == null
          ? null
          : MetaModel.fromJson(json['meta'] as Map<String, dynamic>),
      (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['thumbnail'] as String?,
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'category': instance.category,
      'price': instance.price,
      'discountPercentage': instance.discountPercentage,
      'rating': instance.rating,
      'stock': instance.stock,
      'tags': instance.tags,
      'brand': instance.brand,
      'sku': instance.sku,
      'weight': instance.weight,
      'dimensions': instance.dimensions,
      'warrantyInformation': instance.warrantyInformation,
      'shippingInformation': instance.shippingInformation,
      'availabilityStatus': instance.availabilityStatus,
      'reviews': instance.reviews,
      'returnPolicy': instance.returnPolicy,
      'minimumOrderQuantity': instance.minimumOrderQuantity,
      'meta': instance.meta,
      'images': instance.images,
      'thumbnail': instance.thumbnail,
    };
