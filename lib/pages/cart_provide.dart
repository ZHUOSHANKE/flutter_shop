import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_shop/entity/cart_goods_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvide with ChangeNotifier {
  List<CartGoodsEntity> _cartGoodsList = [];
  final String CART_LIST = "cart_list";

  List<CartGoodsEntity> get cartGoodsList => _cartGoodsList;

  getCartList() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var cartList = preferences.getString(CART_LIST);
    _cartGoodsList.clear();
    if (cartList != null) {
      (jsonDecode(cartList) as List).forEach((item) {
        _cartGoodsList.add(CartGoodsEntity().fromJson(item));
      });
    }
    notifyListeners();
  }

  addCartShopping(CartGoodsEntity goodsEntity) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var cartList = preferences.getString(CART_LIST);
    _cartGoodsList.clear();
    if (cartList != null) {
      (jsonDecode(cartList) as List).forEach((item) {
        if (item["goodId"] == goodsEntity.goodId) {
          item["count"] += 1;
        }
        //item["presentPrice"] = item["count"] * item["presentPrice"];
        _cartGoodsList.add(CartGoodsEntity().fromJson(item));
      });
    }
    bool result = _cartGoodsList.any((i) {
      // 只要集合里面有满足条件的就返回true
      return i.goodId == goodsEntity.goodId;
    });
    if (!result) {
      _cartGoodsList.add(goodsEntity);
    }
    cartList = json.encode(_cartGoodsList);
    preferences.setString(CART_LIST, cartList);
    notifyListeners();
  }

  update(CartGoodsEntity goodsEntity) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (_cartGoodsList.isNotEmpty) {
      _cartGoodsList.forEach((item) {
        if (item.goodId == goodsEntity.goodId) {
          item.count = goodsEntity.count;
          item.isSelected = goodsEntity.isSelected;
        }
      });
    }
    var cartList = json.encode(_cartGoodsList);
    preferences.setString(CART_LIST, cartList);
    notifyListeners();
  }

  double getTotalPrice() {
    var totalPrice = 0.0;
    _cartGoodsList.forEach((value) {
      totalPrice += (value.count * value.presentPrice);
    });
    return totalPrice;
  }

  double getSelectedTotalPrice() {
    var totalPrice = 0.0;
    _cartGoodsList.forEach((value) {
      if (value.isSelected) {
        totalPrice += (value.count * value.presentPrice);
      }
    });
    return totalPrice;
  }

  num getTotalSelectedCount() {
    var totalCount = 0;
    _cartGoodsList.forEach((value) {
      if (value.isSelected) {
        totalCount += value.count;
      }
    });
    return totalCount;
  }

  num getTotalCount() {
    var totalCount = 0;
    _cartGoodsList.forEach((value) {
      totalCount += value.count;
    });
    return totalCount;
  }

  bool isAllSelected() {
    return _cartGoodsList.every((value) {
      return value.isSelected;
    });
  }

  setAllSelected(bool isAllSelected) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (_cartGoodsList.isNotEmpty) {
      _cartGoodsList.forEach((item) {
        item.isSelected = isAllSelected;
      });
    }
    var cartList = json.encode(_cartGoodsList);
    preferences.setString(CART_LIST, cartList);
    notifyListeners();
  }

  deleteGoods(num index) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _cartGoodsList.removeAt(index);
    var cartList = json.encode(_cartGoodsList);
    preferences.setString(CART_LIST, cartList);
    notifyListeners();
  }
}
