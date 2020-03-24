import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/entity/goods_detail_entity.dart';
import 'package:flutter_shop/previde/detail_info.dart';
import 'package:provide/provide.dart';

class DetailComment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: getContentView(context),alignment: Alignment.topCenter,);
  }

  _getListItem(List<GoodsDetailGoodCommants> list) {
    return list.map((commant) {
      return Container(
        decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1.0, color: Colors.black12))),
        padding: EdgeInsets.only(left: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              commant.userName,
              style: TextStyle(fontSize: 12.0, color: Colors.grey),
            ),
            Text(
              commant.comments,
              style: TextStyle(fontSize: 14.0),
            ),
            Text(
              DateTime.fromMillisecondsSinceEpoch(commant.discussTime).toString().split(".")[0],
              style: TextStyle(fontSize: 12.0, color: Colors.grey),
            )
          ],
        ),
      );
    }).toList();
  }

  getContentView(BuildContext context) {
    var goodsDetailEntity = Provide.value<DetailInfoProvide>(context).goodsDetailEntity;
    if (goodsDetailEntity != null && goodsDetailEntity.goodComments != null && !goodsDetailEntity.goodComments.isEmpty) {
      return ListView(
        shrinkWrap: true,
        children: _getListItem(goodsDetailEntity.goodComments),
      );
    }
    return Text("空空如也~");
  }
}
