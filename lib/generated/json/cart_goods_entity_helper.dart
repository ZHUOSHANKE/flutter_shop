import 'package:flutter_shop/entity/cart_goods_entity.dart';

cartGoodsEntityFromJson(CartGoodsEntity data, Map<String, dynamic> json) {
  if (json['goodsSerialNumber'] != null) {
    data.goodsSerialNumber = json['goodsSerialNumber']?.toString();
  }
  if (json['image'] != null) {
    data.image = json['image']?.toString();
  }
  if (json['goodName'] != null) {
    data.goodName = json['goodName']?.toString();
  }
  if (json['presentPrice'] != null) {
    data.presentPrice = json['presentPrice']?.toDouble();
  }
  if (json['itemCode'] != null) {
    data.itemCode = json['itemCode'];
  }
  if (json['goodType'] != null) {
    data.goodType = json['goodType']?.toInt();
  }
  if (json['secondCa'] != null) {
    data.secondCa = json['secondCa']?.toString();
  }
  if (json['firstCa'] != null) {
    data.firstCa = json['firstCa']?.toString();
  }
  if (json['goodId'] != null) {
    data.goodId = json['goodId']?.toString();
  }
  if (json['count'] != null) {
    data.count = json['count']?.toInt();
  }
  if (json['isSelected'] != null) {
    data.isSelected = json['isSelected'];
  }
  return data;
}

Map<String, dynamic> cartGoodsEntityToJson(CartGoodsEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['goodsSerialNumber'] = entity.goodsSerialNumber;
  data['image'] = entity.image;
  data['goodName'] = entity.goodName;
  data['presentPrice'] = entity.presentPrice;
  data['itemCode'] = entity.itemCode;
  data['goodType'] = entity.goodType;
  data['secondCa'] = entity.secondCa;
  data['firstCa'] = entity.firstCa;
  data['goodId'] = entity.goodId;
  data['count'] = entity.count;
  data['isSelected'] = entity.isSelected;
  return data;
}
