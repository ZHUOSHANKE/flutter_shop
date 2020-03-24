
import 'package:fluro/fluro.dart';
import 'package:flutter_shop/routers/router_handler.dart';

class  Routers{
  static String ROOT= "/";
  static String DETAILS_PAGE= "/detail";
  static String ORDER_PAGE= "/order";



  static void  configurePage(Router router){
    router.define(DETAILS_PAGE, handler: detailsHandler);
    router.define(ORDER_PAGE, handler: orderCenterHandler);

  }
}


