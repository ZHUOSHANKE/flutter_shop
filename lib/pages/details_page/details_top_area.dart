import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_shop/entity/goods_detail_entity.dart';
import 'package:flutter_shop/previde/detail_info.dart';
import 'package:provide/provide.dart';

class DetailsTopArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget widget;
    var goodsDetailEntity =
        Provide.value<DetailInfoProvide>(context).goodsDetailEntity;
    if (goodsDetailEntity != null && goodsDetailEntity.goodInfo != null) {
      var goodInfo = goodsDetailEntity.goodInfo;
      widget = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Image.network(
              goodInfo.image1,
            ),
          ),
          _getGoodsInfo(goodInfo)
        ],
      );
    } else {}
    return Container(
      child: widget,
      color: Colors.white,
      width: double.infinity,
    );
  }

  _getGoodsName(String goodsName) {
    return Text(
      goodsName,
      style: TextStyle(color: Colors.black, fontSize: 14),
    );
  }

  _getGoodsTag(String goodsTag) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: Colors.greenAccent),
      child: Text(goodsTag),
    );
  }

  _getGoodsNumber(String goodsNumber) {
    return Container(
      margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Text(
        "编号：$goodsNumber",
        style: TextStyle(fontSize: 12.0, color: Colors.grey),
      ),
    );
  }

  _getGoodsInfo(goodInfo) {
    return Container(
      margin: EdgeInsets.only(left: 6.0,bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _getGoodsName(goodInfo.goodsName),
          _getGoodsNumber(goodInfo.goodsSerialNumber),
          _getGoodsPrice(goodInfo)
        ],
      ),
    );
  }

  _getGoodsPrice(GoodsDetailGoodInfo goodInfo) {
    return Row(
      children: <Widget>[
        Text("￥${goodInfo.presentPrice}",style: TextStyle(color: Colors.red),),
        Container(
          margin: EdgeInsets.only(left: 15.0,right: 10.0),
          child:  Text("市场价格：",style: TextStyle(color: Colors.grey),),
        ),
        Text("￥${goodInfo.oriPrice}",style: TextStyle(color: Colors.black12,
        decoration: TextDecoration.lineThrough),)
      ],
    );
  }
}
