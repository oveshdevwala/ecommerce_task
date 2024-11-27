import 'package:json_annotation/json_annotation.dart';

part 'meta_model.g.dart';

@JsonSerializable()
class MetaModel {
  final String? createdAt;
  final String? updatedAt;
  final String? barcode;
  final String? qrcode;
  MetaModel(
    this.createdAt,
    this.updatedAt,
    this.barcode,
    this.qrcode,
  );

  factory MetaModel.fromJson(Map<String, dynamic> json) =>
      _$MetaModelFromJson(json);
  Map<String, dynamic> toJson() => _$MetaModelToJson(this);
}
