import 'package:flutter/material.dart';
import 'package:flutter_shop/constant.dart';
import 'package:flutter_shop/entity/goods_detail_entity.dart';
import 'package:flutter_shop/service/service_method.dart';

class DetailInfoProvide with ChangeNotifier {
  GoodsDetailEntity _goodsDetailEntity;

  GoodsDetailEntity get goodsDetailEntity => _goodsDetailEntity;

  bool isLeft = true;
  bool isRight = false;

  clickChangeLeftAndRight(String changeState) {
    if (changeState == Constant.LEFT) {
      isLeft = true;
      isRight = false;
    } else if (changeState == Constant.RIGHT) {
      isLeft = false;
      isRight = true;
    }
    notifyListeners();
  }

  getNetWorkGoodsDetail(GoodsDetailEntity entity) {
    _goodsDetailEntity = entity;
    notifyListeners();
  }
}
