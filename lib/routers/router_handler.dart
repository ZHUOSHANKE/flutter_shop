import 'package:fluro/fluro.dart';
import 'package:flutter_shop/pages/details_page.dart';
import 'package:flutter_shop/pages/order_page.dart';
import 'package:flutter_shop/pages/video_page.dart';
import 'package:flutter_shop/pages/video_page_2.dart';
import '../constant.dart';

Handler detailsHandler = Handler(handlerFunc: (context, params) {
  var goodsId = params[Constant.GOODS_ID].first;
  return DetailsPage(
    goodsId: goodsId,
  );
});

Handler orderCenterHandler = Handler(handlerFunc: (context, params) {
  return OrderPage();
});
Handler videoCenterHandler = Handler(handlerFunc: (context, params) {
  return VideoPage();
});
Handler video2CenterHandler = Handler(handlerFunc: (context, params) {
  return VideoPage2();
});
