import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/constant.dart';
import 'package:flutter_shop/pages/details_page/details_web.dart';
import 'package:flutter_shop/previde/detail_info.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provide/provide.dart';

import 'detail_comment.dart';

class DetailPageView extends StatelessWidget {
 final PageController controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: ScreenUtil().setHeight(1010),
        child: Provide<DetailInfoProvide>(builder: (context,chdil,detail){
          if (controller.hasClients) {
            controller.jumpToPage(detail.isLeft?0:1);
          }
          return PageView(
            controller: controller,
            scrollDirection: Axis.horizontal,
            children: <Widget>[DetailsWeb(),DetailComment()],
            onPageChanged: (index){
              Provide.value<DetailInfoProvide>(context).clickChangeLeftAndRight(index==0?Constant.LEFT:Constant.RIGHT);
            },
          );
        }),
    );
  }

  getLeftView() {
    return Container(
      color: Colors.red,
      child: Text("LEFT"),
    );
  }

  getRightView() {
    return Container(
      child: Text("data"),
      color: Colors.blue,
    );
  }
}
