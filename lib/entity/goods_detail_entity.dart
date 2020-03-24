import 'package:flutter_shop/generated/json/base/json_convert_content.dart';
import 'package:flutter_shop/generated/json/base/json_filed.dart';

class GoodsDetailEntity with JsonConvert<GoodsDetailEntity> {
	GoodsDetailGoodInfo goodInfo;
	List<GoodsDetailGoodCommants> goodComments;
	GoodsDetailAdvertesPicture advertesPicture;
}

class GoodsDetailGoodInfo with JsonConvert<GoodsDetailGoodInfo> {
	String image5;
	int amount;
	String image3;
	String image4;
	String goodsId;
	String isOnline;
	String image1;
	String image2;
	@JSONField(name: "TYPE_SHIP")
	int typeShip;
	String goodsSerialNumber;
	double oriPrice;
	double presentPrice;
	String comPic;
	int state;
	String shopId;
	String goodsName;
	String goodsDetail;
}

class GoodsDetailGoodCommants with JsonConvert<GoodsDetailGoodCommants> {
	@JSONField(name: "SCORE")
	int sCORE;
	String comments;
	String userName;
	int discussTime;
}

class GoodsDetailAdvertesPicture with JsonConvert<GoodsDetailAdvertesPicture> {
	@JSONField(name: "PICTURE_ADDRESS")
	String pictureAddress;
	@JSONField(name: "TO_PLACE")
	String toPlace;
	int urlType;
}
