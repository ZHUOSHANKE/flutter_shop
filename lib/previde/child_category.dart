import 'package:flutter/material.dart';
import 'package:flutter_shop/entity/mall_category_entity.dart';

class NotifierCategory with ChangeNotifier {
  List<MallCategoryBxMallSubDto> _subCategoryList = [];
  List<MallCategoryEntity> _categoryList = [];
  int currentSelectedIndex = 0;
  int currentMainSelectedIndex = 0;

  List<MallCategoryBxMallSubDto> get subCategoryList => _subCategoryList;
  List<MallCategoryEntity> get categoryList => _categoryList;

  void setSubCategoryList(String mallCategoryId,List<MallCategoryBxMallSubDto> value) {
    _subCategoryList = value;
    if (!value[0].mallSubName.contains("全部")) {
      var mallCategoryBxMallSubDto = MallCategoryBxMallSubDto();
      mallCategoryBxMallSubDto.mallSubName = "全部";
      mallCategoryBxMallSubDto.mallCategoryId = mallCategoryId;
      mallCategoryBxMallSubDto.mallSubId = "";
      value.insert(0, mallCategoryBxMallSubDto);
    }
    notifyListeners();
  }

  void setCategoryList(List<MallCategoryEntity> value) {
    _categoryList = value;
    notifyListeners();
  }

  void onClickChange(int index) {
    currentSelectedIndex = index;
    notifyListeners();
  }
  void onClickMainCategoryChange(String mallCategoryId,num index) {
    currentMainSelectedIndex = index;
    setSubCategoryList(mallCategoryId, _subCategoryList);
    onClickChange(0);
    notifyListeners();
  }
}
