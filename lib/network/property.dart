class Property{
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
  List<String> PropertyAttributeKeyIds; // 房源属性keyId
}

class PropertyAttribute{
  String title;
  String keyId;
}