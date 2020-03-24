import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/entity/cart_goods_entity.dart';
import 'package:flutter_shop/pages/cart_page/cart_goods_item.dart';
import 'package:flutter_shop/pages/cart_provide.dart';
import 'package:flutter_shop/previde/index_page_provide.dart';
import 'package:provide/provide.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    Provide.value<CartProvide>(context).getCartList();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "购物车",
          style: TextStyle(fontSize: 18.0),
        ),
      ),
      body: Container(child: Provide<CartProvide>(builder: (context, child, cart) {
        return _getContentWidget(cart);
      })),
    );
  }

  _getBottomSettlement() {
    var allSelected = Provide.value<CartProvide>(context).isAllSelected();
    return Container(
      color: Colors.white,
      height: ScreenUtil().setHeight(80),
      padding: EdgeInsets.only(left: 10.0),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 5.0),
            child: InkWell(
                child: allSelected
                    ? Icon(
                        Icons.check_circle,
                        color: Colors.pinkAccent,
                      )
                    : Icon(
                        Icons.radio_button_unchecked,
                        color: Colors.pinkAccent,
                      ),
                onTap: () {
                  Provide.value<CartProvide>(context).setAllSelected(!allSelected);
                }),
          ),
          Expanded(child: Text("全选")),
          getTotalPriceView(),
          MaterialButton(
            minWidth: ScreenUtil().setWidth(60),
            onPressed: () {},
            child: Text(
              "结算(${Provide.value<CartProvide>(context).getTotalSelectedCount()})",
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.pinkAccent,
          ),
        ],
      ),
    );
  }

  getTotalPriceView() {
    return Container(
      margin: EdgeInsets.only(right: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                "合计：",
                style: TextStyle(fontSize: 9.0),
              ),
              Text(
                "￥${Provide.value<CartProvide>(context).getSelectedTotalPrice().toStringAsFixed(2)}",
                style: TextStyle(color: Colors.pinkAccent, fontSize: 9.0),
              )
            ],
          ),
          Text(
            "满68元免配送费，预约免配送费",
            style: TextStyle(fontSize: 9.0),
          )
        ],
      ),
    );
  }

  Widget _getContentWidget(CartProvide cart) {
    Widget widget;
    if (cart.cartGoodsList.isNotEmpty) {
      widget = Column(
        children: <Widget>[
          Expanded(
            child: CartGoodsItem(
              goodsList: cart.cartGoodsList,
            ),
          ),
          _getBottomSettlement()
        ],
      );
    } else {
      widget = GestureDetector(
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: double.infinity,
          child: Text("空空如也,去逛逛~"),
        ),
        onTap: () {
          Provide.value<IndexPageProvide>(context).currentIndex = 0;
        },
      );
    }
    return widget;
  }
}
