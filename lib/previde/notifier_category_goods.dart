import 'package:flutter/material.dart';
import 'package:flutter_shop/entity/mall_category_entity.dart';

class NotifierCategoryGoods with ChangeNotifier {
  MallCategoryBxMallSubDto _subCategory;

  MallCategoryBxMallSubDto get subCategory => _subCategory;


  void setSubCategory(MallCategoryBxMallSubDto value) {
    _subCategory = value;
    notifyListeners();
  }
}
