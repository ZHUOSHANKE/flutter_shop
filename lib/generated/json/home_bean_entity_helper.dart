import 'package:flutter_shop/entity/home_bean_entity.dart';

homeBeanEntityFromJson(HomeBeanEntity data, Map<String, dynamic> json) {
	if (json['slides'] != null) {
		data.slides = new List<HomeBeanSlide>();
		(json['slides'] as List).forEach((v) {
			data.slides.add(new HomeBeanSlide().fromJson(v));
		});
	}
	if (json['shopInfo'] != null) {
		data.shopInfo = new HomeBeanShopInfo().fromJson(json['shopInfo']);
	}
	if (json['integralMallPic'] != null) {
		data.integralMallPic = new HomeBeanIntegralMallPic().fromJson(json['integralMallPic']);
	}
	if (json['toShareCode'] != null) {
		data.toShareCode = new HomeBeanToShareCode().fromJson(json['toShareCode']);
	}
	if (json['recommend'] != null) {
		data.recommend = new List<HomeBeanRecommand>();
		(json['recommend'] as List).forEach((v) {
			data.recommend.add(new HomeBeanRecommand().fromJson(v));
		});
	}
	if (json['advertesPicture'] != null) {
		data.advertesPicture = new HomeBeanAdvertesPicture().fromJson(json['advertesPicture']);
	}
	if (json['floor1'] != null) {
		data.floor1 = new List<HomeBeanFloor1>();
		(json['floor1'] as List).forEach((v) {
			data.floor1.add(new HomeBeanFloor1().fromJson(v));
		});
	}
	if (json['floor2'] != null) {
		data.floor2 = new List<HomeBeanFloor2>();
		(json['floor2'] as List).forEach((v) {
			data.floor2.add(new HomeBeanFloor2().fromJson(v));
		});
	}
	if (json['floor3'] != null) {
		data.floor3 = new List<HomeBeanFloor3>();
		(json['floor3'] as List).forEach((v) {
			data.floor3.add(new HomeBeanFloor3().fromJson(v));
		});
	}
	if (json['saoma'] != null) {
		data.saoma = new HomeBeanSaoma().fromJson(json['saoma']);
	}
	if (json['newUser'] != null) {
		data.newUser = new HomeBeanNewUser().fromJson(json['newUser']);
	}
	if (json['floor1Pic'] != null) {
		data.floor1Pic = new HomeBeanFloor1Pic().fromJson(json['floor1Pic']);
	}
	if (json['floor2Pic'] != null) {
		data.floor2Pic = new HomeBeanFloor2Pic().fromJson(json['floor2Pic']);
	}
	if (json['floorName'] != null) {
		data.floorName = new HomeBeanFloorName().fromJson(json['floorName']);
	}
	if (json['category'] != null) {
		data.category = new List<HomeBeanCategory>();
		(json['category'] as List).forEach((v) {
			data.category.add(new HomeBeanCategory().fromJson(v));
		});
	}
	if (json['floor3Pic'] != null) {
		data.floor3Pic = new HomeBeanFloor3Pic().fromJson(json['floor3Pic']);
	}
	if (json['reservationGoods'] != null) {
		data.reservationGoods = new List<dynamic>();
		data.reservationGoods.addAll(json['reservationGoods']);
	}
	return data;
}

Map<String, dynamic> homeBeanEntityToJson(HomeBeanEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.slides != null) {
		data['slides'] =  entity.slides.map((v) => v.toJson()).toList();
	}
	if (entity.shopInfo != null) {
		data['shopInfo'] = entity.shopInfo.toJson();
	}
	if (entity.integralMallPic != null) {
		data['integralMallPic'] = entity.integralMallPic.toJson();
	}
	if (entity.toShareCode != null) {
		data['toShareCode'] = entity.toShareCode.toJson();
	}
	if (entity.recommend != null) {
		data['recommend'] =  entity.recommend.map((v) => v.toJson()).toList();
	}
	if (entity.advertesPicture != null) {
		data['advertesPicture'] = entity.advertesPicture.toJson();
	}
	if (entity.floor1 != null) {
		data['floor1'] =  entity.floor1.map((v) => v.toJson()).toList();
	}
	if (entity.floor2 != null) {
		data['floor2'] =  entity.floor2.map((v) => v.toJson()).toList();
	}
	if (entity.floor3 != null) {
		data['floor3'] =  entity.floor3.map((v) => v.toJson()).toList();
	}
	if (entity.saoma != null) {
		data['saoma'] = entity.saoma.toJson();
	}
	if (entity.newUser != null) {
		data['newUser'] = entity.newUser.toJson();
	}
	if (entity.floor1Pic != null) {
		data['floor1Pic'] = entity.floor1Pic.toJson();
	}
	if (entity.floor2Pic != null) {
		data['floor2Pic'] = entity.floor2Pic.toJson();
	}
	if (entity.floorName != null) {
		data['floorName'] = entity.floorName.toJson();
	}
	if (entity.category != null) {
		data['category'] =  entity.category.map((v) => v.toJson()).toList();
	}
	if (entity.floor3Pic != null) {
		data['floor3Pic'] = entity.floor3Pic.toJson();
	}
	if (entity.reservationGoods != null) {
		data['reservationGoods'] =  [];
	}
	return data;
}

homeBeanSlideFromJson(HomeBeanSlide data, Map<String, dynamic> json) {
	if (json['image'] != null) {
		data.image = json['image']?.toString();
	}
	if (json['urlType'] != null) {
		data.urlType = json['urlType']?.toInt();
	}
	if (json['goodsId'] != null) {
		data.goodsId = json['goodsId']?.toString();
	}
	return data;
}

Map<String, dynamic> homeBeanSlideToJson(HomeBeanSlide entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['image'] = entity.image;
	data['urlType'] = entity.urlType;
	data['goodsId'] = entity.goodsId;
	return data;
}

homeBeanShopInfoFromJson(HomeBeanShopInfo data, Map<String, dynamic> json) {
	if (json['SHOP_CODE'] != null) {
		data.shopCode = json['SHOP_CODE']?.toString();
	}
	if (json['leaderPhone'] != null) {
		data.leaderPhone = json['leaderPhone']?.toString();
	}
	if (json['leaderImage'] != null) {
		data.leaderImage = json['leaderImage']?.toString();
	}
	if (json['SHOP_NAME'] != null) {
		data.shopName = json['SHOP_NAME']?.toString();
	}
	return data;
}

Map<String, dynamic> homeBeanShopInfoToJson(HomeBeanShopInfo entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['SHOP_CODE'] = entity.shopCode;
	data['leaderPhone'] = entity.leaderPhone;
	data['leaderImage'] = entity.leaderImage;
	data['SHOP_NAME'] = entity.shopName;
	return data;
}

homeBeanIntegralMallPicFromJson(HomeBeanIntegralMallPic data, Map<String, dynamic> json) {
	if (json['PICTURE_ADDRESS'] != null) {
		data.pictureAddress = json['PICTURE_ADDRESS']?.toString();
	}
	if (json['TO_PLACE'] != null) {
		data.toPlace = json['TO_PLACE']?.toString();
	}
	if (json['urlType'] != null) {
		data.urlType = json['urlType']?.toInt();
	}
	return data;
}

Map<String, dynamic> homeBeanIntegralMallPicToJson(HomeBeanIntegralMallPic entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['PICTURE_ADDRESS'] = entity.pictureAddress;
	data['TO_PLACE'] = entity.toPlace;
	data['urlType'] = entity.urlType;
	return data;
}

homeBeanToShareCodeFromJson(HomeBeanToShareCode data, Map<String, dynamic> json) {
	if (json['PICTURE_ADDRESS'] != null) {
		data.pictureAddress = json['PICTURE_ADDRESS']?.toString();
	}
	if (json['TO_PLACE'] != null) {
		data.toPlace = json['TO_PLACE']?.toString();
	}
	if (json['urlType'] != null) {
		data.urlType = json['urlType']?.toInt();
	}
	return data;
}

Map<String, dynamic> homeBeanToShareCodeToJson(HomeBeanToShareCode entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['PICTURE_ADDRESS'] = entity.pictureAddress;
	data['TO_PLACE'] = entity.toPlace;
	data['urlType'] = entity.urlType;
	return data;
}

homeBeanRecommandFromJson(HomeBeanRecommand data, Map<String, dynamic> json) {
	if (json['image'] != null) {
		data.image = json['image']?.toString();
	}
	if (json['mallPrice'] != null) {
		data.mallPrice = json['mallPrice']?.toDouble();
	}
	if (json['goodsName'] != null) {
		data.goodsName = json['goodsName']?.toString();
	}
	if (json['goodsId'] != null) {
		data.goodsId = json['goodsId']?.toString();
	}
	if (json['price'] != null) {
		data.price = json['price']?.toDouble();
	}
	return data;
}

Map<String, dynamic> homeBeanRecommandToJson(HomeBeanRecommand entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['image'] = entity.image;
	data['mallPrice'] = entity.mallPrice;
	data['goodsName'] = entity.goodsName;
	data['goodsId'] = entity.goodsId;
	data['price'] = entity.price;
	return data;
}

homeBeanAdvertesPictureFromJson(HomeBeanAdvertesPicture data, Map<String, dynamic> json) {
	if (json['PICTURE_ADDRESS'] != null) {
		data.pictureAddress = json['PICTURE_ADDRESS']?.toString();
	}
	if (json['TO_PLACE'] != null) {
		data.toPlace = json['TO_PLACE']?.toString();
	}
	if (json['urlType'] != null) {
		data.urlType = json['urlType']?.toInt();
	}
	return data;
}

Map<String, dynamic> homeBeanAdvertesPictureToJson(HomeBeanAdvertesPicture entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['PICTURE_ADDRESS'] = entity.pictureAddress;
	data['TO_PLACE'] = entity.toPlace;
	data['urlType'] = entity.urlType;
	return data;
}

homeBeanFloor1FromJson(HomeBeanFloor1 data, Map<String, dynamic> json) {
	if (json['image'] != null) {
		data.image = json['image']?.toString();
	}
	if (json['goodsId'] != null) {
		data.goodsId = json['goodsId']?.toString();
	}
	return data;
}

Map<String, dynamic> homeBeanFloor1ToJson(HomeBeanFloor1 entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['image'] = entity.image;
	data['goodsId'] = entity.goodsId;
	return data;
}

homeBeanFloor2FromJson(HomeBeanFloor2 data, Map<String, dynamic> json) {
	if (json['image'] != null) {
		data.image = json['image']?.toString();
	}
	if (json['goodsId'] != null) {
		data.goodsId = json['goodsId']?.toString();
	}
	return data;
}

Map<String, dynamic> homeBeanFloor2ToJson(HomeBeanFloor2 entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['image'] = entity.image;
	data['goodsId'] = entity.goodsId;
	return data;
}

homeBeanFloor3FromJson(HomeBeanFloor3 data, Map<String, dynamic> json) {
	if (json['image'] != null) {
		data.image = json['image']?.toString();
	}
	if (json['goodsId'] != null) {
		data.goodsId = json['goodsId']?.toString();
	}
	return data;
}

Map<String, dynamic> homeBeanFloor3ToJson(HomeBeanFloor3 entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['image'] = entity.image;
	data['goodsId'] = entity.goodsId;
	return data;
}

homeBeanSaomaFromJson(HomeBeanSaoma data, Map<String, dynamic> json) {
	if (json['PICTURE_ADDRESS'] != null) {
		data.pictureAddress = json['PICTURE_ADDRESS']?.toString();
	}
	if (json['TO_PLACE'] != null) {
		data.toPlace = json['TO_PLACE']?.toString();
	}
	if (json['urlType'] != null) {
		data.urlType = json['urlType']?.toInt();
	}
	return data;
}

Map<String, dynamic> homeBeanSaomaToJson(HomeBeanSaoma entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['PICTURE_ADDRESS'] = entity.pictureAddress;
	data['TO_PLACE'] = entity.toPlace;
	data['urlType'] = entity.urlType;
	return data;
}

homeBeanNewUserFromJson(HomeBeanNewUser data, Map<String, dynamic> json) {
	if (json['PICTURE_ADDRESS'] != null) {
		data.pictureAddress = json['PICTURE_ADDRESS']?.toString();
	}
	if (json['TO_PLACE'] != null) {
		data.toPlace = json['TO_PLACE']?.toString();
	}
	if (json['urlType'] != null) {
		data.urlType = json['urlType']?.toInt();
	}
	return data;
}

Map<String, dynamic> homeBeanNewUserToJson(HomeBeanNewUser entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['PICTURE_ADDRESS'] = entity.pictureAddress;
	data['TO_PLACE'] = entity.toPlace;
	data['urlType'] = entity.urlType;
	return data;
}

homeBeanFloor1PicFromJson(HomeBeanFloor1Pic data, Map<String, dynamic> json) {
	if (json['PICTURE_ADDRESS'] != null) {
		data.pictureAddress = json['PICTURE_ADDRESS']?.toString();
	}
	if (json['TO_PLACE'] != null) {
		data.toPlace = json['TO_PLACE']?.toString();
	}
	if (json['urlType'] != null) {
		data.urlType = json['urlType']?.toInt();
	}
	return data;
}

Map<String, dynamic> homeBeanFloor1PicToJson(HomeBeanFloor1Pic entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['PICTURE_ADDRESS'] = entity.pictureAddress;
	data['TO_PLACE'] = entity.toPlace;
	data['urlType'] = entity.urlType;
	return data;
}

homeBeanFloor2PicFromJson(HomeBeanFloor2Pic data, Map<String, dynamic> json) {
	if (json['PICTURE_ADDRESS'] != null) {
		data.pictureAddress = json['PICTURE_ADDRESS']?.toString();
	}
	if (json['TO_PLACE'] != null) {
		data.toPlace = json['TO_PLACE']?.toString();
	}
	if (json['urlType'] != null) {
		data.urlType = json['urlType']?.toInt();
	}
	return data;
}

Map<String, dynamic> homeBeanFloor2PicToJson(HomeBeanFloor2Pic entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['PICTURE_ADDRESS'] = entity.pictureAddress;
	data['TO_PLACE'] = entity.toPlace;
	data['urlType'] = entity.urlType;
	return data;
}

homeBeanFloorNameFromJson(HomeBeanFloorName data, Map<String, dynamic> json) {
	if (json['floor1'] != null) {
		data.floor1 = json['floor1']?.toString();
	}
	if (json['floor2'] != null) {
		data.floor2 = json['floor2']?.toString();
	}
	if (json['floor3'] != null) {
		data.floor3 = json['floor3']?.toString();
	}
	return data;
}

Map<String, dynamic> homeBeanFloorNameToJson(HomeBeanFloorName entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['floor1'] = entity.floor1;
	data['floor2'] = entity.floor2;
	data['floor3'] = entity.floor3;
	return data;
}

homeBeanCategoryFromJson(HomeBeanCategory data, Map<String, dynamic> json) {
	if (json['mallCategoryId'] != null) {
		data.mallCategoryId = json['mallCategoryId']?.toString();
	}
	if (json['mallCategoryName'] != null) {
		data.mallCategoryName = json['mallCategoryName']?.toString();
	}
	if (json['bxMallSubDto'] != null) {
		data.bxMallSubDto = new List<HomeBeanCategoryBxMallSubDto>();
		(json['bxMallSubDto'] as List).forEach((v) {
			data.bxMallSubDto.add(new HomeBeanCategoryBxMallSubDto().fromJson(v));
		});
	}
	if (json['comments'] != null) {
		data.comments = json['comments'];
	}
	if (json['image'] != null) {
		data.image = json['image']?.toString();
	}
	return data;
}

Map<String, dynamic> homeBeanCategoryToJson(HomeBeanCategory entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['mallCategoryId'] = entity.mallCategoryId;
	data['mallCategoryName'] = entity.mallCategoryName;
	if (entity.bxMallSubDto != null) {
		data['bxMallSubDto'] =  entity.bxMallSubDto.map((v) => v.toJson()).toList();
	}
	data['comments'] = entity.comments;
	data['image'] = entity.image;
	return data;
}

homeBeanCategoryBxMallSubDtoFromJson(HomeBeanCategoryBxMallSubDto data, Map<String, dynamic> json) {
	if (json['mallSubId'] != null) {
		data.mallSubId = json['mallSubId']?.toString();
	}
	if (json['mallCategoryId'] != null) {
		data.mallCategoryId = json['mallCategoryId']?.toString();
	}
	if (json['mallSubName'] != null) {
		data.mallSubName = json['mallSubName']?.toString();
	}
	if (json['comments'] != null) {
		data.comments = json['comments']?.toString();
	}
	return data;
}

Map<String, dynamic> homeBeanCategoryBxMallSubDtoToJson(HomeBeanCategoryBxMallSubDto entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['mallSubId'] = entity.mallSubId;
	data['mallCategoryId'] = entity.mallCategoryId;
	data['mallSubName'] = entity.mallSubName;
	data['comments'] = entity.comments;
	return data;
}

homeBeanFloor3PicFromJson(HomeBeanFloor3Pic data, Map<String, dynamic> json) {
	if (json['PICTURE_ADDRESS'] != null) {
		data.pictureAddress = json['PICTURE_ADDRESS']?.toString();
	}
	if (json['TO_PLACE'] != null) {
		data.toPlace = json['TO_PLACE']?.toString();
	}
	if (json['urlType'] != null) {
		data.urlType = json['urlType']?.toInt();
	}
	return data;
}

Map<String, dynamic> homeBeanFloor3PicToJson(HomeBeanFloor3Pic entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['PICTURE_ADDRESS'] = entity.pictureAddress;
	data['TO_PLACE'] = entity.toPlace;
	data['urlType'] = entity.urlType;
	return data;
}