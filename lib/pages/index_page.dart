import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/pages/cart_page.dart';
import 'package:flutter_shop/pages/category_page.dart';
import 'package:flutter_shop/pages/home_page.dart';
import 'package:flutter_shop/pages/member_page.dart';
import 'package:flutter_shop/previde/index_page_provide.dart';
import 'package:provide/provide.dart';

/// 不允许出现三层嵌套
class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final List<BottomNavigationBarItem> tabItem = [
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), title: Text("首页")),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.search), title: Text("分类")),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.shopping_cart), title: Text("购物车")),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.profile_circled), title: Text("会员中心")),
  ];
  final List<Widget> pages = [HomePage(), CategoryPage(), CartPage(), MemberPage()];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334);
    return Provide<IndexPageProvide>(
      builder: (context, child, index) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            items: tabItem,
            type: BottomNavigationBarType.fixed,
            currentIndex: index.currentIndex,
            onTap: (index) {
              Provide.value<IndexPageProvide>(context).currentIndex = index;
            },
          ),
          body: IndexedStack(
            index: Provide.value<IndexPageProvide>(context).currentIndex,
            children: pages,
          ),
        );
      },
    );
  }
}
