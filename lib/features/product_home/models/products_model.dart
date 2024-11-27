// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:ecommerce_task/features/product_home/models/product_model.dart';

part 'products_model.g.dart';

@JsonSerializable()
class ProductsModel {
  final List<ProductModel>? products;
  final int? total;
  final int? skip;
  final int? limit;
  ProductsModel(
    this.products,
    this.total,
    this.skip,
    this.limit,
  );

  factory ProductsModel.fromJson(Map<String, dynamic> json) =>
      _$ProductsModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductsModelToJson(this);
}
