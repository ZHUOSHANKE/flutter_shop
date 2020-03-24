import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_shop/entity/cart_goods_entity.dart';
import 'package:provide/provide.dart';

import '../cart_provide.dart';

class CartGoodsItem extends StatelessWidget {
  final List<CartGoodsEntity> goodsList;

  const CartGoodsItem({Key key, @required this.goodsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      children: getListTile(goodsList, context),
    ));
  }

  getListTile(List<CartGoodsEntity> goodsList, BuildContext context) {
    var list = goodsList
        .map((value) => Container(
            height: ScreenUtil().setHeight(160),
            padding: EdgeInsets.only(bottom: 10.0, left: 10.0),
            decoration: BoxDecoration(color: Colors.white, border: Border(bottom: BorderSide(color: Colors.black12, width: 1.0))),
            child: Row(
              children: <Widget>[
                InkWell(
                    child: value.isSelected
                        ? Icon(Icons.check_circle, color: Colors.pinkAccent)
                        : Icon(
                            Icons.radio_button_unchecked,
                            color: Colors.pinkAccent,
                          ),
                    onTap: () {
                      value.isSelected = !value.isSelected;
                      Provide.value<CartProvide>(context).update(value);
                    }),
                getGoodsImage(value),
                Expanded(child: getNameAndCount(value, context)),
                _getPriceAndDelete(value, goodsList.indexOf(value), context),
              ],
            )))
        .toList();
    list.add(_getFooter(goodsList, context));
    return list;
  }

  _getFooter(List<CartGoodsEntity> goodsList, BuildContext context) {
    return Container(
      color: Colors.white,
      height: 25.0,
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              "共${goodsList.length}件商品",
              style: TextStyle(fontSize: 10.0),
            ),
          ),
          Text(
            "小计：${Provide.value<CartProvide>(context).getTotalPrice().toStringAsFixed(2)}",
            style: TextStyle(color: Colors.redAccent, fontSize: 10.0),
          )
        ],
      ),
    );
  }

  getGoodsImage(CartGoodsEntity value) {
    return Container(
      height: ScreenUtil().setHeight(100),
      margin: EdgeInsets.only(left: 10.0),
      decoration: BoxDecoration(color: Colors.white, border: Border.all(width: 1.0, color: Colors.black12)),
      child: Image.network(
        value.image,
        fit: BoxFit.fill,
      ),
    );
  }

  getNameAndCount(CartGoodsEntity value, BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(100),
      padding: EdgeInsets.only(left: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
              child: Text(
            value.goodName,
            style: TextStyle(fontSize: 12.0),
          )),
          getCountAddAndSubtract(value, context)
        ],
      ),
    );
  }

  getCountAddAndSubtract(CartGoodsEntity value, BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, border: Border.all(width: 1.0, color: Colors.black12)),
      height: ScreenUtil().setHeight(40),
      width: ScreenUtil().setHeight(40) * 3.15,
      child: Row(
        children: <Widget>[
          InkWell(
            child: Container(
              width: ScreenUtil().setWidth(40),
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.white, border: Border(right: BorderSide(width: 1.0, color: Colors.black12))),
              child: Text("-"),
            ),
            onTap: () {
              if (value.count != 1) {
                value.count -= 1;
                Provide.value<CartProvide>(context).update(value);
              }
            },
          ),
          Container(
            width: ScreenUtil().setWidth(40),
            alignment: Alignment.center,
            child: Text(
              "${value.count}",
              style: TextStyle(fontSize: 12.0),
            ),
          ),
          InkWell(
            child: Container(
              width: ScreenUtil().setWidth(40),
              decoration: BoxDecoration(color: Colors.white, border: Border(left: BorderSide(width: 1.0, color: Colors.black12))),
              alignment: Alignment.center,
              child: Text("+"),
            ),
            onTap: () {
              value.count += 1;
              Provide.value<CartProvide>(context).update(value);
            },
          )
        ],
      ),
    );
  }

  _getPriceAndDelete(CartGoodsEntity value, num index, BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(100),
      margin: EdgeInsets.only(right: 12.0),
      child: Column(
        children: <Widget>[
          Expanded(child: Text("￥${value.presentPrice.toStringAsFixed(2)}")),
          InkWell(
            child: Icon(
              Icons.delete_outline,
              color: Colors.grey,
            ),
            onTap: () {
              Provide.value<CartProvide>(context).deleteGoods(index);
            },
          )
        ],
      ),
    );
  }
}
