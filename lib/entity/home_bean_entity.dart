import 'package:flutter_shop/generated/json/base/json_convert_content.dart';
import 'package:flutter_shop/generated/json/base/json_filed.dart';

class HomeBeanEntity with JsonConvert<HomeBeanEntity> {
	List<HomeBeanSlide> slides;
	HomeBeanShopInfo shopInfo;
	HomeBeanIntegralMallPic integralMallPic;
	HomeBeanToShareCode toShareCode;
	List<HomeBeanRecommand> recommend;
	HomeBeanAdvertesPicture advertesPicture;
	List<HomeBeanFloor1> floor1;
	List<HomeBeanFloor2> floor2;
	List<HomeBeanFloor3> floor3;
	HomeBeanSaoma saoma;
	HomeBeanNewUser newUser;
	HomeBeanFloor1Pic floor1Pic;
	HomeBeanFloor2Pic floor2Pic;
	HomeBeanFloorName floorName;
	List<HomeBeanCategory> category;
	HomeBeanFloor3Pic floor3Pic;
	List<dynamic> reservationGoods;
}

class HomeBeanSlide with JsonConvert<HomeBeanSlide> {
	String image;
	int urlType;
	String goodsId;
}

class HomeBeanShopInfo with JsonConvert<HomeBeanShopInfo> {
	@JSONField(name: "SHOP_CODE")
	String shopCode;
	String leaderPhone;
	String leaderImage;
	@JSONField(name: "SHOP_NAME")
	String shopName;
}

class HomeBeanIntegralMallPic with JsonConvert<HomeBeanIntegralMallPic> {
	@JSONField(name: "PICTURE_ADDRESS")
	String pictureAddress;
	@JSONField(name: "TO_PLACE")
	String toPlace;
	int urlType;
}

class HomeBeanToShareCode with JsonConvert<HomeBeanToShareCode> {
	@JSONField(name: "PICTURE_ADDRESS")
	String pictureAddress;
	@JSONField(name: "TO_PLACE")
	String toPlace;
	int urlType;
}

class HomeBeanRecommand with JsonConvert<HomeBeanRecommand> {
	String image;
	double mallPrice;
	String goodsName;
	String goodsId;
	double price;
}

class HomeBeanAdvertesPicture with JsonConvert<HomeBeanAdvertesPicture> {
	@JSONField(name: "PICTURE_ADDRESS")
	String pictureAddress;
	@JSONField(name: "TO_PLACE")
	String toPlace;
	int urlType;
}

class HomeBeanFloor1 with JsonConvert<HomeBeanFloor1> {
	String image;
	String goodsId;
}

class HomeBeanFloor2 with JsonConvert<HomeBeanFloor2> {
	String image;
	String goodsId;
}

class HomeBeanFloor3 with JsonConvert<HomeBeanFloor3> {
	String image;
	String goodsId;
}

class HomeBeanSaoma with JsonConvert<HomeBeanSaoma> {
	@JSONField(name: "PICTURE_ADDRESS")
	String pictureAddress;
	@JSONField(name: "TO_PLACE")
	String toPlace;
	int urlType;
}

class HomeBeanNewUser with JsonConvert<HomeBeanNewUser> {
	@JSONField(name: "PICTURE_ADDRESS")
	String pictureAddress;
	@JSONField(name: "TO_PLACE")
	String toPlace;
	int urlType;
}

class HomeBeanFloor1Pic with JsonConvert<HomeBeanFloor1Pic> {
	@JSONField(name: "PICTURE_ADDRESS")
	String pictureAddress;
	@JSONField(name: "TO_PLACE")
	String toPlace;
	int urlType;
}

class HomeBeanFloor2Pic with JsonConvert<HomeBeanFloor2Pic> {
	@JSONField(name: "PICTURE_ADDRESS")
	String pictureAddress;
	@JSONField(name: "TO_PLACE")
	String toPlace;
	int urlType;
}

class HomeBeanFloorName with JsonConvert<HomeBeanFloorName> {
	String floor1;
	String floor2;
	String floor3;
}

class HomeBeanCategory with JsonConvert<HomeBeanCategory> {
	String mallCategoryId;
	String mallCategoryName;
	List<HomeBeanCategoryBxMallSubDto> bxMallSubDto;
	dynamic comments;
	String image;
}

class HomeBeanCategoryBxMallSubDto with JsonConvert<HomeBeanCategoryBxMallSubDto> {
	String mallSubId;
	String mallCategoryId;
	String mallSubName;
	String comments;
}

class HomeBeanFloor3Pic with JsonConvert<HomeBeanFloor3Pic> {
	@JSONField(name: "PICTURE_ADDRESS")
	String pictureAddress;
	@JSONField(name: "TO_PLACE")
	String toPlace;
	int urlType;
}
