import 'package:flutter/material.dart';

import 'order_page/order_list.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> with SingleTickerProviderStateMixin {
  TabController _tabController;
  List _tabs;

  @override
  void initState() {
    super.initState();
    _tabs = [
      "全部",
      "待付款",
      "待发货",
      "待收货",
      "待评价",
    ];
    _tabController = new TabController(length: _tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "订单中心",
          style: TextStyle(fontSize: 18.0),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[getTabBar(),Expanded(child: OrderList())],
        ),
      ),
    );
  }

  getTabBar() {
    return Container(
      color: Colors.white,
      child: TabBar(
        tabs: _tabs.map((tabName) {
          return Tab(
              text: tabName,
            );
        }).toList(),
        controller: _tabController,
        labelColor: Colors.pinkAccent,
        unselectedLabelColor: Colors.black87,
        unselectedLabelStyle: TextStyle(fontSize: 12.0),
        labelStyle: TextStyle(fontSize: 12.0),
        indicatorSize: TabBarIndicatorSize.label,
        labelPadding: EdgeInsets.only(right: 10.0,left: 10.0),
        isScrollable: false,
        indicatorColor: Colors.pinkAccent,
        onTap: (index){
          print("${_tabs[index]}");
        },
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
