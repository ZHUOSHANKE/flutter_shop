import 'package:flutter_shop/pages/cart_provide.dart';
import 'package:flutter_shop/previde/location_provide.dart';
import 'package:flutter_shop/previde/order_provide.dart';
import 'package:provide/provide.dart';
import 'package:flutter_shop/previde/notifier_category_goods.dart';
import 'package:flutter_shop/previde/child_category.dart';
import 'package:flutter_shop/previde/detail_info.dart';
import 'package:flutter_shop/previde/index_page_provide.dart';
import 'category_goods_provide.dart';
class  ConfigProvide extends  Provide{

  initProvide(){
    return Providers()
      ..provide(Provider<OrderProvide>.value(OrderProvide()))
      ..provide(Provider<LocationProvide>.value(LocationProvide()))
      ..provide(Provider<IndexPageProvide>.value(IndexPageProvide()))
      ..provide(Provider<CartProvide>.value(CartProvide()))
      ..provide(Provider<IndexPageProvide>.value(IndexPageProvide()))
      ..provide(Provider<NotifierCategory>.value(NotifierCategory()))
      ..provide(Provider<NotifierCategoryGoods>.value(NotifierCategoryGoods()))
      ..provide(Provider<DetailInfoProvide>.value(DetailInfoProvide()))
      ..provide(Provider<CategoryGoodsProvide>.value(CategoryGoodsProvide()));
  }
}