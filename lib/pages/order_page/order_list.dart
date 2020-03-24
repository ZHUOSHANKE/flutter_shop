import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/previde/index_page_provide.dart';
import 'package:flutter_shop/previde/order_provide.dart';
import 'package:provide/provide.dart';

class OrderList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var orderList = Provide.value<OrderProvide>(context).orderList;
    if (orderList.isNotEmpty) {
      return Container();
    }
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(bottom: 40.0),
        child: Text("空空如也,去逛逛~"),
      ),
      onTap: () {
        Navigator.pop(context);
        Provide.value<IndexPageProvide>(context).currentIndex = 0;
      },
    );
  }
}
