import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_shop/entity/cart_goods_entity.dart';
import 'package:flutter_shop/previde/detail_info.dart';
import 'package:flutter_shop/previde/index_page_provide.dart';
import 'package:flutter_shop/routers/appliaction.dart';
import 'package:provide/provide.dart';

import '../cart_provide.dart';

class DetailBottom extends  StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(80),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[goShoppingCart(context), addShoppingCart(context), buyNow()],
      ),
    );
  }

  Expanded buyNow() {
    return Expanded(
      flex: 2,
      child: InkWell(
        child: Container(
          color: Colors.pinkAccent,
          alignment: Alignment.center,
          child: Text(
            "立即购买",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Expanded addShoppingCart(BuildContext context) {
    return Expanded(
      flex: 2,
      child: InkWell(
        child: Container(
          color: Colors.green,
          alignment: Alignment.center,
          child: Text("加入购物车", style: TextStyle(color: Colors.white)),
        ),
        onTap: () {
          var entity = Provide.value<DetailInfoProvide>(context).goodsDetailEntity;
          if (entity != null && entity.goodInfo != null) {
            var info = entity.goodInfo;
            Provide.value<CartProvide>(context)
                .addCartShopping(CartGoodsEntity.fromValue(info.image1, info.goodsName, info.presentPrice, info.goodsId, 1));
          }
        },
      ),
    );
  }

  Expanded goShoppingCart(BuildContext context) {
    return Expanded(
        child: InkWell(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Icon(
                Icons.shopping_cart,
                color: Colors.pinkAccent,
              ),
             Provide<CartProvide>(builder: (context,child,cartProvide){
               return  getRedPoint(cartProvide.getTotalCount());
             })
            ],
          ),
          onTap: () {
            Provide.value<IndexPageProvide>(context).currentIndex =2;
            Navigator.pop(context);
          },
        ));
  }

  getRedPoint(num addCartCount) {
    Widget widget;
    if (addCartCount!=0) {
      widget =   Positioned(
          left: 40.0,top: 3.0,
          child: Container(
            width: ScreenUtil().setWidth(32),
            height: ScreenUtil().setHeight(32),
            alignment: Alignment.center,
            decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
            child: Text(
              "${addCartCount}",
              style: TextStyle(fontSize: 9.0, color: Colors.white),
            ),
          ));
    }  else{
      widget = Container();
    }
    return widget;
  }
}