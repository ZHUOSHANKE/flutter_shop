import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/entity/mall_category_entity.dart';
import 'package:flutter_shop/entity/mall_goods_entity.dart';
import 'package:flutter_shop/previde/notifier_category_goods.dart';
import 'package:flutter_shop/previde/category_goods_provide.dart';
import 'package:flutter_shop/previde/child_category.dart';
import 'package:flutter_shop/routers/appliaction.dart';
import 'package:flutter_shop/routers/routers.dart';
import 'package:flutter_shop/service/service_method.dart';
import 'package:flutter_shop/widget/custom_refresh.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provide/provide.dart';

import '../constant.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("分类",style: TextStyle(fontSize: 18.0),),
      ),
      body: Row(
        children: <Widget>[
          LeftCategoryNav(),
          Column(
            children: <Widget>[
              RightCategoryNav(),
              Expanded(
                child: CategoryGoods(),
              )
            ],
          )
        ],
      ),
    );
  }
}

//左侧分类
class LeftCategoryNav extends StatefulWidget {
  @override
  _LeftCategoryNavState createState() => _LeftCategoryNavState();
}

class _LeftCategoryNavState extends State<LeftCategoryNav> {
  var currentIndex = 0; //当前选择的类型
  var addAllCategorySub;
  ScrollController _controller = ScrollController();

  @override
  void initState() {
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(180),
      decoration: BoxDecoration(border: Border(right: BorderSide(color: Colors.black12, width: 1.0))),
      child: _getListView(),
    );
  }

  _getData() async {
    await getCategoryData().then((onValue) {
      Provide.value<NotifierCategory>(context).setCategoryList(onValue);
      Provide.value<NotifierCategory>(context).setSubCategoryList(onValue[0].mallCategoryId, onValue[0].bxMallSubDto);
    });
  }

  _getListView() {
    return Provide<NotifierCategory>(builder: (context, child, category) {
      if (_controller.hasClients) {
        _controller.animateTo(category.currentMainSelectedIndex.toDouble()*15,duration:Duration(milliseconds: 300),curve: Curves.linearToEaseOut);
      }
      return ListView.builder(
        controller: _controller,
        itemBuilder: (context, index) {
          return _getCategoryItem(categoryList[index], index);
        },
        itemCount: categoryList.length,
      );
    });
  }

  _getCategoryItem(MallCategoryEntity category, int index) {
    currentIndex = Provide.value<NotifierCategory>(context).currentMainSelectedIndex;
    return InkWell(
      child: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 10.0),
        decoration: BoxDecoration(
            color: currentIndex == index ? Colors.black12 : Colors.white, border: Border(bottom: BorderSide(width: 1.0, color: Colors.black12))),
        height: ScreenUtil().setHeight(100),
        child: Text(
          category.mallCategoryName,
          style: TextStyle(fontSize: 12.0, color: currentIndex != index ? Colors.black : Colors.pinkAccent),
        ),
      ),
      onTap: () {
        if (currentIndex == index) {
          return;
        }
        Provide.value<NotifierCategory>(context).onClickMainCategoryChange(category.mallCategoryId, index);
        Provide.value<CategoryGoodsProvide>(context).getCategoryGoodsList(category.mallCategoryId, "");
      },
    );
  }
}

//右侧分类
class RightCategoryNav extends StatefulWidget {
  @override
  _RightCategoryNavState createState() => _RightCategoryNavState();
}

class _RightCategoryNavState extends State<RightCategoryNav> {
  ScrollController _controller = new ScrollController();
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Colors.white, border: Border(bottom: BorderSide(color: Colors.black12, width: 1.0))),
        width: ScreenUtil().setWidth(570),
        height: ScreenUtil().setHeight(80),
        child: Provide<NotifierCategory>(builder: (context, child, notCategory) {
          if (_controller.hasClients) {
            _controller.animateTo(notCategory.currentSelectedIndex.toDouble()*40,duration:Duration(milliseconds: 300),curve: Curves.linearToEaseOut);
          }
          return ListView(
            controller:  _controller,
            scrollDirection: Axis.horizontal,
            children: _getCategoryItem(notCategory.subCategoryList),
          );
        }));
  }

  _getCategoryItem(List<MallCategoryBxMallSubDto> list) {
    var currentSelectedIndex = Provide.value<NotifierCategory>(context).currentSelectedIndex;
    return list.map((value) {
      return InkWell(
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 5, right: 5),
          child: Text(
            value.mallSubName,
            style: TextStyle(color: currentSelectedIndex != list.indexOf(value) ? Colors.black : Colors.pinkAccent),
          ),
        ),
        onTap: () {
          if (currentSelectedIndex == list.indexOf(value)) {
            return;
          }
          setState(() {
            currentSelectedIndex = list.indexOf(value);
          });
          Provide.value<NotifierCategoryGoods>(context).setSubCategory(value);
          Provide.value<NotifierCategory>(context).onClickChange(currentSelectedIndex);
          Provide.value<CategoryGoodsProvide>(context).getCategoryGoodsList(value.mallCategoryId, value.mallSubId);
        },
      );
    }).toList();
  }
}

//右侧分类商品列表
class CategoryGoods extends StatefulWidget {
  final List<MallGoodsEntity> goodsList = List();

  @override
  _CategoryGoodsState createState() => _CategoryGoodsState();
}

class _CategoryGoodsState extends State<CategoryGoods> {
  final EasyRefreshController _controller = EasyRefreshController();
  final ScrollController sc = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
        width: ScreenUtil().setWidth(570),
        child: Provide<CategoryGoodsProvide>(builder: (context, child, category) {
          _controller.finishLoad(noMore: category.isMore);
          if (Provide.value<CategoryGoodsProvide>(context).page == 1 && sc.hasClients) {
            sc.jumpTo(0.0);
          }
          return CustomRefresh(
            childWidget: buildListView(category),
            scrollController: sc,
            controller: _controller,
            onLoad: () async {
              var mallCategoryId = Provide.value<CategoryGoodsProvide>(context).mallCategoryId;
              var mallSubCategoryId = Provide.value<CategoryGoodsProvide>(context).mallSubCategoryId;
              Provide.value<CategoryGoodsProvide>(context).addPage();
              getCategoryGoods(mallCategoryId, mallSubCategoryId, Provide.value<CategoryGoodsProvide>(context).page).then((val) {
                Provide.value<CategoryGoodsProvide>(context).setCategoryList(val);
                Provide.value<CategoryGoodsProvide>(context).setMoreStatus(val.length == 0);
                if (val.length == 0) {
                  Fluttertoast.showToast(
                      msg: "已经到底了",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIos: 1,
                      backgroundColor: Colors.pink,
                      textColor: Colors.white,
                      fontSize: 16.0);
                }
              });
            },
          );
        }));
  }

//创建商品列表
  ListView buildListView(CategoryGoodsProvide category) {
    return ListView(
      children: <Widget>[
        GridView.count(
          shrinkWrap: true,
          controller: ScrollController(keepScrollOffset: false),
          crossAxisCount: 2,
          crossAxisSpacing: 1.0,
          mainAxisSpacing: 1.0,
          children: _getItem(category.goodsList),
        )
      ],
    );
  }

//创建商品Item
  _getItem(List<MallGoodsEntity> list) {
    return list
        .map((goods) => InkWell(
              child: Container(
                padding: EdgeInsets.only(left: 10.0),
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Image.network(
                        goods.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[getGoodsName(goods), Expanded(child: _getPriceWidget(goods))],
                      ),
                    )
                  ],
                ),
              ),
              onTap: () {
                Application.router.navigateTo(context, "${Routers.DETAILS_PAGE}?${Constant.GOODS_ID}=${goods.goodsId}");
              },
            ))
        .toList();
  }

  //商品名称
  Container getGoodsName(MallGoodsEntity goods) {
    return Container(
      child: Text(
        goods.goodsName,
        style: TextStyle(color: Colors.pinkAccent, fontSize: 12.0),
        overflow: TextOverflow.ellipsis,
      ),
      alignment: Alignment.centerLeft,
    );
  }

  _getPriceWidget(MallGoodsEntity goods) {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
              child: Text(
            "￥${goods.oriPrice}",
            style: TextStyle(fontSize: ScreenUtil().setSp(12) * 2),
          )),
          Expanded(
              child: Text(
            "￥${goods.presentPrice}",
            style: TextStyle(decoration: TextDecoration.lineThrough, color: Colors.grey, fontSize: ScreenUtil().setSp(12) * 2),
          ))
        ],
      ),
    );
  }
}
