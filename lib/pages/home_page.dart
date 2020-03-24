import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/entity/home_bean_entity.dart';
import 'package:flutter_shop/entity/hot_goods_entity.dart';
import 'package:flutter_shop/previde/category_goods_provide.dart';
import 'package:flutter_shop/previde/child_category.dart';
import 'package:flutter_shop/previde/detail_info.dart';
import 'package:flutter_shop/previde/index_page_provide.dart';
import 'package:flutter_shop/routers/appliaction.dart';
import 'package:flutter_shop/routers/routers.dart';
import 'package:flutter_shop/widget/custom_refresh.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provide/provide.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constant.dart';
import '../service/service_method.dart';

List hotGoods = new List();

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  EasyRefreshController _controller;
  int page = 1;

  @override
  void initState() {
    _controller = EasyRefreshController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("首页",style: TextStyle(fontSize: 18.0),),
        ),
        body: Container(
          color: Color(0xFFEFEFEF),
          child: FutureBuilder<HomeBeanEntity>(
            builder: (context, snapshot) {
              Widget widget;
              if (snapshot.hasData) {
                widget = _getListWidget(snapshot);
              } else if (snapshot.hasError) {
                widget = Center(
                  child: Text("请求出错啦~"),
                );
              } else {
                widget = Center(
                  child: Text("获取数据中~"),
                );
              }
              return widget;
            },
            future: getHomePageContent(),
          ),
        ));
  }

  @override
  bool get wantKeepAlive => true;

  _getListWidget(AsyncSnapshot<HomeBeanEntity> snapshot) {
    return CustomRefresh(
      controller: _controller,
      childWidget: ListView(
        children: <Widget>[
          SwiperDiy(
            bannerList: snapshot.data.slides,
          ),
          TopNavigator(
            categoryList: snapshot.data.category,
          ),
          AdBanner(banner: snapshot.data.advertesPicture.pictureAddress),
          LeaderPhone(
            leaderImage: snapshot.data.shopInfo.leaderImage,
            leaderPhone: snapshot.data.shopInfo.leaderPhone,
          ),
          FightSpike(
            images: [
              snapshot.data.saoma.pictureAddress,
              snapshot.data.integralMallPic.pictureAddress,
              snapshot.data.newUser.pictureAddress,
            ],
          ),
          RecommendGoodsWidget(
            goods: snapshot.data.recommend,
          ),
          RecommandFoods(
            titleImage: snapshot.data.floor1Pic.pictureAddress,
            foodListImage: snapshot.data.floor1
                .map((floor) => Map.of({
                      "image": floor.image,
                      "goodsId": floor.goodsId,
                    }))
                .toList(),
          ),
          RecommandFoods(
            titleImage: snapshot.data.floor2Pic.pictureAddress,
            foodListImage: snapshot.data.floor2
                .map((floor) => Map.of({
                      "image": floor.image,
                      "goodsId": floor.goodsId,
                    }))
                .toList(),
          ),
          RecommandFoods(
            titleImage: snapshot.data.floor3Pic.pictureAddress,
            foodListImage: snapshot.data.floor3
                .map((floor) => Map.of({
                      "image": floor.image,
                      "goodsId": floor.goodsId,
                    }))
                .toList(),
          ),
          HotGoods(),
        ],
      ),
      onRefresh: () async {
        page = 1;
        await _getData(false);
      },
      onLoad: () async {
        page++;
        await _getData(true);
      },
    );
  }

  _getData(bool isLoad) {
    getHomeHotGoods(page).then((val) {
      if (!isLoad) {
        hotGoods.clear();
        _controller.resetLoadState();
      } else {
        _controller.finishLoad(noMore: val.length == 0);
      }
      hotGoods.addAll(val);
      setState(() {});
    });
  }
}

class SwiperDiy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(333),
      child: Swiper(
        itemCount: bannerList.length,
        itemBuilder: (context, index) {
          return InkWell(
            child: Image.network(
              bannerList[index].image,
              fit: BoxFit.fill,
            ),
            onTap: () {
              Application.router.navigateTo(context, "${Routers.DETAILS_PAGE}?${Constant.GOODS_ID}=${bannerList[index].goodsId}");
            },
          );
        },
        pagination: SwiperPagination(),
        autoplayDelay: 5000,
        autoplay: true,
      ),
    );
  }

  final List<HomeBeanSlide> bannerList;

  SwiperDiy({Key key, this.bannerList});
}

class TopNavigator extends StatelessWidget {
  final List<HomeBeanCategory> categoryList;

  const TopNavigator({Key key, this.categoryList}) : super(key: key);

  Widget _gridViewItem(BuildContext context, HomeBeanCategory item) {
    return InkWell(
      onTap: () {
        Provide.value<IndexPageProvide>(context).currentIndex=1;
        Provide.value<NotifierCategory>(context)
            .onClickMainCategoryChange(item.mallCategoryId,categoryList.indexOf(item));
        Provide.value<CategoryGoodsProvide>(context).getCategoryGoodsList(item.mallCategoryId, "");
      },
      child: Column(
        children: <Widget>[
          Image.network(
            item.image,
            width: ScreenUtil().setWidth(95),
          ),
          Text(item.mallCategoryName)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        height: ScreenUtil().setHeight(330),
        child: GridView.builder(
          controller: ScrollController(keepScrollOffset: false),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
          itemBuilder: (context, index) {
            return _gridViewItem(context, categoryList[index]);
          },
          itemCount: categoryList.length - categoryList.length % 5,
        ));
  }
}

class AdBanner extends StatelessWidget {
  final String banner;

  const AdBanner({Key key, this.banner}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5.0),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Image.network(banner),
        ],
      ),
    );
  }
}

class LeaderPhone extends StatelessWidget {
  final String leaderPhone;
  final String leaderImage;

  const LeaderPhone({Key key, this.leaderPhone, this.leaderImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          _dialNumber();
        },
        child: Image.network(leaderImage),
      ),
    );
  }

  _dialNumber() async {
    String tel = "tel:15249213888";
    if (await canLaunch(tel)) {
      await launch(tel);
    } else {
      throw "Could not launch $tel";
    }
  }
}

class FightSpike extends StatelessWidget {
  final List<String> images;

  const FightSpike({Key key, this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5.0),
      child: GridView.count(
        crossAxisCount: 3,
        shrinkWrap: true,
        childAspectRatio: 0.7,
        controller: ScrollController(keepScrollOffset: false),
        children: _getItem(),
      ),
    );
  }

  _getItem() {
    return images
        .map((image) => Container(
              child: Image.network(
                image,
                fit: BoxFit.fill,
              ),
            ))
        .toList();
  }
}

class RecommendGoodsWidget extends StatelessWidget {
  final List<HomeBeanRecommand> goods;

  RecommendGoodsWidget({Key key, this.goods}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[_getTitle(), _getGoods(context)],
      ),
    );
  }

  _getTitle() {
    return Container(
        margin: EdgeInsets.only(top: 5.0),
        height: 45.0,
        color: Colors.white,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 12.0),
        child: Text(
          "推荐商品",
          style: TextStyle(color: Colors.pinkAccent),
        ));
  }

  _getGoods(BuildContext context) {
    return Container(
      height: ScreenUtil().setWidth(330),
      margin: EdgeInsets.only(top: 1.0),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return _getGoodsItem(context, goods[index]);
        },
        itemCount: 3,
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  _getGoodsItem(BuildContext context, HomeBeanRecommand goods) {
    return InkWell(
      onTap: () {
        Application.router.navigateTo(context, "${Routers.DETAILS_PAGE}?${Constant.GOODS_ID}=${goods.goodsId}");
      },
      child: Container(
        width: ScreenUtil().setWidth(750) / 3,
        decoration: BoxDecoration(color: Colors.white, border: Border(left: BorderSide(width: 1.0, color: Colors.grey[100]))),
        child: Column(
          children: <Widget>[
            Image.network(
              goods.image,
              width: ScreenUtil().setWidth(240),
            ),
            Text(
              "￥${goods.mallPrice}",
              style: TextStyle(),
            ),
            Text(
              "￥${goods.price}",
              style: TextStyle(decoration: TextDecoration.lineThrough, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

class RecommandFoods extends StatelessWidget {
  final String titleImage;
  final List<Map<String, String>> foodListImage;

  const RecommandFoods({Key key, this.titleImage, this.foodListImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[_getTitleImage(), _getFoodsList(context)],
      ),
    );
  }

  _getTitleImage() {
    return Container(
      margin: EdgeInsets.only(top: 5.0, left: 15.0, right: 15.0),
      child: Image.network(titleImage),
    );
  }

  _getFoodsList(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 5.0),
        child: Column(
          children: [_getTopTable(context), _getBottom(context)],
        ));
  }

  _getWrapItem(BuildContext context, int index) {
    return InkWell(
      child: Container(
        child: Image.network(foodListImage[index]["image"]),
      ),
      onTap: () {
        Application.router.navigateTo(context, "${Routers.DETAILS_PAGE}?${Constant.GOODS_ID}=${foodListImage[index]["goodsId"]}");
      },
    );
  }

  _getTopTable(BuildContext context) {
    return Table(
      children: [
        TableRow(children: [
          _getWrapItem(context, 0),
          Column(
            children: <Widget>[
              _getWrapItem(context, 1),
              _getWrapItem(context, 2),
            ],
          ),
        ])
      ],
    );
  }

  _getBottom(BuildContext context) {
    return Container(
      child: Table(
        children: [
          TableRow(children: [
            _getWrapItem(context, 3),
            _getWrapItem(context, 4),
          ])
        ],
      ),
    );
  }
}

class HotGoods extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[_getHotTitle(), _getHotGoodsItem(context)],
    );
  }

  _getHotTitle() {
    return Container(
      margin: EdgeInsets.only(top: 5.0,bottom: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: ScreenUtil().setHeight(30),
            height: ScreenUtil().setHeight(30),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.pinkAccent,
              shape: BoxShape.circle
            ),
            child: Text("火",style: TextStyle(color: Colors.white,fontSize: 9.0),),
          ),
          Text("火爆专区",
            style: TextStyle(color: Colors.black87,fontSize: 12.0),
          )
        ],
      ),
    );
  }

  _getHotGoodsItem(BuildContext context) {
    if (hotGoods.length != 0) {
      var list = hotGoods
          .map(
            (goods) => InkWell(
              onTap: () {
                Application.router.navigateTo(context, "${Routers.DETAILS_PAGE}?${Constant.GOODS_ID}=${goods.goodsId}");
              },
              child: Container(color: Colors.white, child: _getColumn(goods)),
            ),
          )
          .toList();
      return GridView.count(
        crossAxisCount: 2,
        children: list,
        shrinkWrap: true,
        controller: ScrollController(keepScrollOffset: false),
      );
    } else {
      return Text("");
    }
  }

  _getColumn(HotGoodsEntity goods) => Column(
        children: <Widget>[
          Image.network(
            goods.image,
            width: double.infinity,
            height: ScreenUtil().setWidth(260),
            fit: BoxFit.fitHeight,
          ),
          Text(
            goods.name,
            style: TextStyle(color: Colors.pinkAccent),
            overflow: TextOverflow.ellipsis,
          ),
          Container(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Text(
                  "￥${goods.price}",
                )),
                Expanded(
                    child: Text(
                  "￥${goods.mallPrice}",
                  style: TextStyle(
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                  ),
                ))
              ],
            ),
          )
        ],
      );
}
