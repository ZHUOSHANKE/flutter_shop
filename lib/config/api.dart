import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_shop/entity/BaseRresponse.dart';

const API_URL = "https://wxmini.baixingliangfan.cn/baixing/";

//接口路径
const HOME_PAGE_CONTENT = "/wxmini/homePageContent";
const HOME_PAGE_BELOW_CONTEN = "/wxmini/homePageBelowConten";
const GET_CATEGORY = "/wxmini/getCategory";
const GET_MALL_GOODS = "/wxmini/getMallGoods";
const GET_GOOD_DETAIL_BY_ID = "/wxmini/getGoodDetailById";

Dio _instcae;

Dio getDio() {
  if (_instcae == null) {
    _instcae = Dio()
      ..options.baseUrl = API_URL
      ..options.contentType = "application/x-www-form-urlencoded;charset=UTF-8";
  }
  return _instcae;
}

//获取首页主题内容
Future<BaseResponse> httpPost({String path, Map map}) async {
  try {
    var response = await getDio().post(path, queryParameters: map);
    if (response.statusCode == 200) {
        var decode = json.decode(response.data);
      return BaseResponse.formJson(decode);
    } else {
      throw HttpException("接口请求异常！！！");
    }
  } catch (e) {
    print("ERRRO:==============>>>$e");
  }
}
