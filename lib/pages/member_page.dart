import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_shop/routers/appliaction.dart';
import 'package:flutter_shop/routers/routers.dart';

class MemberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RadioListTile(value: null, groupValue: null, onChanged: null);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "会员中心",
          style: TextStyle(fontSize: 18.0),
        ),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            getHeaderWidget(),
            GestureDetector(
              child: Container(
                height: ScreenUtil().setHeight(80),
                padding: EdgeInsets.only(left: 12.0),
                margin: EdgeInsets.only(top: 12.0),
                color: Colors.white,
                child: _getItemTile(Icons.assignment, "我的订单"),
              ),
              onTap: () {
                Application.router.navigateTo(context, "${Routers.ORDER_PAGE}");
              },
            ),
            getOrderWidget(context),
            Container(
              height: ScreenUtil().setHeight(80),
              padding: EdgeInsets.only(left: 12.0),
              margin: EdgeInsets.only(top: 12.0),
              color: Colors.white,
              child: _getItemTile(Icons.confirmation_number, "领取优惠券"),
            ),
            Container(
              height: ScreenUtil().setHeight(80),
              padding: EdgeInsets.only(left: 12.0),
              decoration: BoxDecoration(color: Colors.white, border: Border(top: BorderSide(width: 0.5, color: Colors.black12))),
              child: _getItemTile(Icons.confirmation_number, "已领取优惠券"),
            ),
            Container(
              height: ScreenUtil().setHeight(80),
              padding: EdgeInsets.only(left: 12.0),
              decoration: BoxDecoration(color: Colors.white, border: Border(top: BorderSide(width: 0.5, color: Colors.black12))),
              child: _getItemTile(Icons.add_location, "地址管理"),
            ),
            Container(
              height: ScreenUtil().setHeight(80),
              padding: EdgeInsets.only(left: 12.0),
              margin: EdgeInsets.only(top: 10.0),
              color: Colors.white,
              child: _getItemTile(Icons.assignment_late, "关于我们"),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.white, border: Border(top: BorderSide(width: 0.5, color: Colors.black12))),
              height: ScreenUtil().setHeight(80),
              padding: EdgeInsets.only(left: 12.0),
              child: _getItemTile(Icons.subtitles, "建议投诉"),
            ),
          ],
        ),
      ),
    );
  }

  getHeaderWidget() {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          width: double.infinity,
          height: ScreenUtil().setHeight(400),
          child: Image.network(
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1584968016488&di=fd59415dd2920e3a43185c3b04fe8f7b&imgtype=0&src=http%3A%2F%2Fn.sinaimg.cn%2Fsinacn12%2F164%2Fw2048h1316%2F20180614%2Fd645-hcwpcmq8346782.jpg",
            fit: BoxFit.cover,
          ),
        ),
        Container(
          width: double.infinity,
          height: ScreenUtil().setHeight(400),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Container(color: Colors.white.withOpacity(0.1)),
          ),
        ),
        Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(1.5),
              decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              child: CircleAvatar(child: Image.network("src"), radius: 40),
            ),
            InkWell(
              child: Container(
                alignment: Alignment.center,
                height: ScreenUtil().setHeight(40),
                width: ScreenUtil().setHeight(120),
                margin: EdgeInsets.only(top: 10.0),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black87, width: 1.0), borderRadius: BorderRadius.all(Radius.circular(2.0))),
                child: Text(
                  "登录/注册",
                  style: TextStyle(fontSize: 10.0),
                ),
              ),
            )
          ],
        )
      ],
    );
  }

  _getItemTile(IconData icon, String title) {
    return Row(
      children: <Widget>[
        Icon(
          icon,
          color: Colors.grey,
          size: 22.0,
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 10.0),
            child: Text(
              title,
              style: TextStyle(color: Colors.grey, fontSize: 12.0),
            ),
          ),
        ),
        Icon(
          Icons.chevron_right,
          color: Colors.grey,
        )
      ],
    );
  }

  getOrderWidget(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: ScreenUtil().setHeight(140),
      decoration: BoxDecoration(color: Colors.white, border: Border(top: BorderSide(width: 0.5, color: Colors.black12))),
      child: Row(
        children: <Widget>[
          Expanded(
              child: InkWell(
            child: getIconText(Icons.payment, "待付款"),
            onTap: () {
              Application.router.navigateTo(context, "${Routers.ORDER_PAGE}");
            },
          )),
          Expanded(
              child: InkWell(
            child: getIconText(Icons.payment, "待发货"),
            onTap: () {
              Application.router.navigateTo(context, "${Routers.ORDER_PAGE}");
            },
          )),
          Expanded(
              child: InkWell(
            child: getIconText(Icons.payment, "待待收货"),
            onTap: () {
              Application.router.navigateTo(context, "${Routers.ORDER_PAGE}");
            },
          )),
          Expanded(
              child: InkWell(
            child: getIconText(Icons.payment, "待评价"),
            onTap: () {
              Application.router.navigateTo(context, "${Routers.ORDER_PAGE}");
            },
          ))
        ],
      ),
    );
  }

  getIconText(IconData iconData, String title) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconData,
          color: Colors.grey,
          size: 23.0,
        ),
        Text(
          title,
          style: TextStyle(color: Colors.grey, fontSize: 12.0),
        )
      ],
    );
  }
}
