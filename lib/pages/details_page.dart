import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/constant.dart';
import 'package:flutter_shop/entity/goods_detail_entity.dart';
import 'package:flutter_shop/pages/details_page/detail_bottom.dart';
import 'package:flutter_shop/pages/details_page/details_explain.dart';
import 'package:flutter_shop/pages/details_page/details_top_area.dart';
import 'package:flutter_shop/previde/detail_info.dart';
import 'package:flutter_shop/service/service_method.dart';
import 'package:provide/provide.dart';

import 'details_page/detail_page_view.dart';
import 'details_page/detail_taber_layout.dart';
class DetailsPage extends StatefulWidget {
  final String goodsId;

  DetailsPage({Key key, this.goodsId}) : super(key: key);
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  String  _title="商品详情";
  @override
  Widget build(BuildContext context) {
    Provide.value<DetailInfoProvide>(context).clickChangeLeftAndRight(Constant.LEFT);
    return Scaffold(
      appBar: AppBar(
        title: Text(_title,style: TextStyle(fontSize: 18.0),),
      ),
      body: FutureBuilder<GoodsDetailEntity>(
        builder: (context, sncapshot) {
          Widget childWidget;
          if (sncapshot.hasData) {
            childWidget = Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                    child: ListView(
                  children: <Widget>[DetailsTopArea(), DetailsExplain(), DetailTaberLayout(), DetailPageView()],
                )),
                DetailBottom()
              ],
            );
          } else {
            childWidget = Container(
              alignment: Alignment.center,
              child: Text("加载中。。。。"),
            );
          }
          return childWidget;
        },
        future: getGoodsDetail(widget.goodsId).then((onValue) {
          Provide.value<DetailInfoProvide>(context).getNetWorkGoodsDetail(onValue);
       /*   setState(() {
            _title = onValue.goodInfo.goodsName;
          });*/
          return onValue;
        }),
      ),
    );
  }
}
