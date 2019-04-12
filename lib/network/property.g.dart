// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Property _$PropertyFromJson(Map<String, dynamic> json) {
  return Property(
      json['KeyId'] as String,
      (json['Square'] as num)?.toDouble(),
      (json['SquareUse'] as num)?.toDouble(),
      json['HouseType'] as String,
      (json['RentPrice'] as num)?.toDouble(),
      (json['SalePrice'] as num)?.toDouble(),
      json['HouseDirectionKeyId'] as String,
      json['TrustType'] as int,
      json['PropertyAssess'] as String,
      json['PropertySaleAssess'] as String,
      (json['PropertyAttributeKeyIds'] as List)
          ?.map((e) => e as String)
          ?.toList());
}

Map<String, dynamic> _$PropertyToJson(Property instance) => <String, dynamic>{
      'KeyId': instance.KeyId,
      'Square': instance.Square,
      'SquareUse': instance.SquareUse,
      'HouseType': instance.HouseType,
      'RentPrice': instance.RentPrice,
      'SalePrice': instance.SalePrice,
      'HouseDirectionKeyId': instance.HouseDirectionKeyId,
      'TrustType': instance.TrustType,
      'PropertyAssess': instance.PropertyAssess,
      'PropertySaleAssess': instance.PropertySaleAssess,
      'PropertyAttributeKeyIds': instance.PropertyAttributeKeyIds
    };
