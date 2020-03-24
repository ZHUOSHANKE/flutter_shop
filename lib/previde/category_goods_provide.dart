import 'package:flutter/material.dart';
import 'package:flutter_shop/entity/mall_category_entity.dart';
import 'package:flutter_shop/entity/mall_goods_entity.dart';
import 'package:flutter_shop/service/service_method.dart';

class CategoryGoodsProvide with ChangeNotifier {
  List<MallGoodsEntity> _goodsList = [];

  List<MallGoodsEntity> get goodsList => _goodsList;
  String mallCategoryId;
  String mallSubCategoryId;
  int page;
  bool isMore = true;

  void setCategoryList(List<MallGoodsEntity> value) {
    _goodsList.addAll(value);
    notifyListeners();
  }

  void setMoreStatus(bool isMore) {
    this.isMore = isMore;
    notifyListeners();
  }

  void addPage() {
    ++page;
  }

  getCategoryGoodsList(
    String mallCategoryId,
    String mallSubCategoryId,
  ) {
    this.mallCategoryId = mallCategoryId;
    this.mallSubCategoryId = mallSubCategoryId;
    page = 1;
    getCategoryGoods(mallCategoryId, mallSubCategoryId, page).then((onValue) {
      _goodsList.clear();
      setCategoryList(onValue);
      setMoreStatus(onValue.length<20);
    });
  }
}
