import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_shop/previde/detail_info.dart';
import 'package:provide/provide.dart';

class DetailsWeb extends StatelessWidget {
  Widget build(BuildContext context) {
    var goodsDetailEntity = Provide.value<DetailInfoProvide>(context).goodsDetailEntity;
    if (goodsDetailEntity != null && goodsDetailEntity.goodInfo != null) {
      return Container(
          child: ListView(
        shrinkWrap: true,
        children: <Widget>[Html(data: goodsDetailEntity.goodInfo.goodsDetail,)],
      ));
    }
    return Text('空空如也~');
  }
}
