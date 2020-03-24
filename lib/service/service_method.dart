import 'dart:async';
import 'dart:io';
import 'package:flutter_shop/entity/goods_detail_entity.dart';
import 'package:flutter_shop/entity/home_bean_entity.dart';
import 'package:flutter_shop/entity/hot_goods_entity.dart';
import 'package:flutter_shop/entity/mall_category_entity.dart';
import 'package:flutter_shop/entity/mall_goods_entity.dart';

import '../config/api.dart';
import '../config/api.dart';

//获取首页主题内容
Future<HomeBeanEntity> getHomePageContent() {
  print("开始获取首页数据。。。。。。。。");
  try {
    var formData = {"lon": "108.94712", "lat": "34.29318"};
    var future = httpPost(path: HOME_PAGE_CONTENT, map: formData);
    return future.then((response) {
      if (response.message == "success") {
        return HomeBeanEntity().fromJson(response.data);
      } else {
        throw HttpException("接口请求异常！！！");
      }
    });
  } catch (e) {
    print("ERRRO:==============>>>$e");
    return e;
  }
}

List<HotGoodsEntity> hotGoodsList = List<HotGoodsEntity>();
//获取首页火爆商品
Future<List<HotGoodsEntity>> getHomeHotGoods(int page) {
  print("开始火爆数据。。。。。。。。");
  try {
    var formData = {
      "page": page,
    };
    var future = httpPost(path: HOME_PAGE_BELOW_CONTEN, map: formData);
    return future.then((response) {
      if (response.message == "success") {
        hotGoodsList.clear();
        if (response.data != null) {
          (response.data as List).forEach((v) {
            hotGoodsList.add(new HotGoodsEntity().fromJson(v));
          });
        }
        return hotGoodsList;
      } else {
        throw HttpException("接口请求异常！！！");
      }
    });
  } catch (e) {
    print("ERRRO:==============>>>$e");
    return e;
  }
}

List<MallCategoryEntity> categoryList = List<MallCategoryEntity>();
//获取分类数据
Future<List<MallCategoryEntity>> getCategoryData() {
  try {
    var future = httpPost(path: GET_CATEGORY);
    return future.then((response) {
      if (response.message == "success") {
        categoryList.clear();
        if (response.data != null) {
          (response.data as List).forEach((v) {
            categoryList.add(new MallCategoryEntity().fromJson(v));
          });
        }
        return categoryList;
      } else {
        throw HttpException("接口请求异常！！！");
      }
    });
  } catch (e) {
    print("ERRRO:==============>>>$e");
    return e;
  }
}

List<MallGoodsEntity> categoryGoodsList = List<MallGoodsEntity>();
//获取分类数据
Future<List<MallGoodsEntity>> getCategoryGoods(
  String categoryId,
  String categorySubId,
  int page,
) {
  try {
    var from = {
      "categoryId": categoryId,
      "categorySubId": categorySubId,
      "page": page
    };
    var future = httpPost(path: GET_MALL_GOODS,map: from);
    return future.then((response) {
      if (response.message == "success") {
        categoryGoodsList.clear();
        if (response.data != null) {
          (response.data as List).forEach((v) {
            categoryGoodsList.add(new MallGoodsEntity().fromJson(v));
          });
        }
        return categoryGoodsList;
      } else {
        throw HttpException("接口请求异常！！！");
      }
    });
  } catch (e) {
    print("ERRRO:==============>>>$e");
    return e;
  }
}
//获取分类数据
Future<GoodsDetailEntity> getGoodsDetail(
  String goodsId,) {
  try {
    var from = {
      "goodId": goodsId,
    };
    var future = httpPost(path: GET_GOOD_DETAIL_BY_ID,map: from);
    return future.then((response) {
      if (response.message == "success") {
        return GoodsDetailEntity().fromJson(response.data);
      } else {
        throw HttpException("接口请求异常！！！");
      }
    });
  } catch (e) {
    print("ERRRO:==============>>>$e");
    return e;
  }
}
