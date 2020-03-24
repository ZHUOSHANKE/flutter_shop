import 'package:flutter_shop/generated/json/base/json_convert_content.dart';

class CartGoodsEntity with JsonConvert<CartGoodsEntity> {
  String goodsSerialNumber;
  String image;
  String goodName;
  double presentPrice;
  dynamic itemCode;
  int goodType;
  String secondCa;
  String firstCa;
  String goodId;
  num count;
  bool isSelected = false;

  CartGoodsEntity();

  CartGoodsEntity.fromValue(this.image, this.goodName, this.presentPrice, this.goodId, this.count);
}
