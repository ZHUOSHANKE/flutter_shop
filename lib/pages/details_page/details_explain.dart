import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_shop/previde/detail_info.dart';
import 'package:provide/provide.dart';

class DetailsExplain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 10.0,bottom: 10.0),
      padding: EdgeInsets.only(left: 8.0,top: 10.0,bottom: 10.0),
      child: Text("说明：>急速送达>正品保证"
      ,style: TextStyle(color: Colors.red[600]),),
    );
  }
}
