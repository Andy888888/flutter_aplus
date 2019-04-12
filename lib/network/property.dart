import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'property.g.dart';

@JsonSerializable()
class Property {
  String KeyId;
  double Square; // 建筑面积
  double SquareUse; // 实用面积
  String HouseType; // 房型
  double RentPrice; // 租价
  double SalePrice; // 售价
  String HouseDirectionKeyId; // 朝向KeyId
  int TrustType; // 交易类型
  String PropertyAssess; // 出租点评
  String PropertySaleAssess; // 出售点评
  List<String> PropertyAttributeKeyIds;

//  const Property();

  Property(
      this.KeyId,
      this.Square,
      this.SquareUse,
      this.HouseType,
      this.RentPrice,
      this.SalePrice,
      this.HouseDirectionKeyId,
      this.TrustType,
      this.PropertyAssess,
      this.PropertySaleAssess,
      this.PropertyAttributeKeyIds); // 房源属性keyId

  factory Property.fromJson(Map<String, dynamic> json) =>
      _$PropertyFromJson(json);

  Map<String, dynamic> toJson() => _$PropertyToJson(this);
}

class PropertyAttribute {
  String title;
  String keyId;
}
