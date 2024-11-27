// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dimensions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DimensionsModel _$DimensionsModelFromJson(Map<String, dynamic> json) =>
    DimensionsModel(
      (json['width'] as num?)?.toDouble(),
      (json['height'] as num?)?.toDouble(),
      (json['depth'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$DimensionsModelToJson(DimensionsModel instance) =>
    <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
      'depth': instance.depth,
    };
