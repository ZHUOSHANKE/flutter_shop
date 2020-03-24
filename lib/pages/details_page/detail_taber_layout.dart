import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_shop/constant.dart';
import 'package:flutter_shop/previde/detail_info.dart';
import 'package:provide/provide.dart';

class DetailTaberLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: ScreenUtil().setHeight(75),
        child: Provide<DetailInfoProvide>(
          builder: (context, child, provide) {
            return Row(
              children: <Widget>[getLeftTab(context, provide.isLeft), getRightTab(context, provide.isRight)],
            );
          },
        ));
  }

  getLeftTab(BuildContext context, bool isLeft) {
    return Expanded(
        child: InkWell(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(color: Colors.white, border: Border(bottom: BorderSide(color: isLeft ? Colors.pinkAccent : Colors.white))),
        child: Text("详情",style: TextStyle(color: isLeft?Colors.pinkAccent:Colors.black),),
      ),
      onTap: () {
        Provide.value<DetailInfoProvide>(context).clickChangeLeftAndRight(Constant.LEFT);
      },
    ));
  }

  getRightTab(BuildContext context, bool isRight) {
    return Expanded(
      child: InkWell(
        child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(color: Colors.white, border: Border(bottom: BorderSide(color: isRight ? Colors.pinkAccent : Colors.white))),
            child: Text("评论",style: TextStyle(color: isRight?Colors.pinkAccent:Colors.black),)),
        onTap: () {
          Provide.value<DetailInfoProvide>(context).clickChangeLeftAndRight(Constant.RIGHT);
        },
      ),
    );
  }
}
