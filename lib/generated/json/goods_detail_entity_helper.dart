import 'package:flutter_shop/entity/goods_detail_entity.dart';

goodsDetailEntityFromJson(GoodsDetailEntity data, Map<String, dynamic> json) {
	if (json['goodInfo'] != null) {
		data.goodInfo = new GoodsDetailGoodInfo().fromJson(json['goodInfo']);
	}
	if (json['goodComments'] != null) {
		data.goodComments = new List<GoodsDetailGoodCommants>();
		(json['goodComments'] as List).forEach((v) {
			data.goodComments.add(new GoodsDetailGoodCommants().fromJson(v));
		});
	}
	if (json['advertesPicture'] != null) {
		data.advertesPicture = new GoodsDetailAdvertesPicture().fromJson(json['advertesPicture']);
	}
	return data;
}

Map<String, dynamic> goodsDetailEntityToJson(GoodsDetailEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.goodInfo != null) {
		data['goodInfo'] = entity.goodInfo.toJson();
	}
	if (entity.goodComments != null) {
		data['goodComments'] =  entity.goodComments.map((v) => v.toJson()).toList();
	}
	if (entity.advertesPicture != null) {
		data['advertesPicture'] = entity.advertesPicture.toJson();
	}
	return data;
}

goodsDetailGoodInfoFromJson(GoodsDetailGoodInfo data, Map<String, dynamic> json) {
	if (json['image5'] != null) {
		data.image5 = json['image5']?.toString();
	}
	if (json['amount'] != null) {
		data.amount = json['amount']?.toInt();
	}
	if (json['image3'] != null) {
		data.image3 = json['image3']?.toString();
	}
	if (json['image4'] != null) {
		data.image4 = json['image4']?.toString();
	}
	if (json['goodsId'] != null) {
		data.goodsId = json['goodsId']?.toString();
	}
	if (json['isOnline'] != null) {
		data.isOnline = json['isOnline']?.toString();
	}
	if (json['image1'] != null) {
		data.image1 = json['image1']?.toString();
	}
	if (json['image2'] != null) {
		data.image2 = json['image2']?.toString();
	}
	if (json['TYPE_SHIP'] != null) {
		data.typeShip = json['TYPE_SHIP']?.toInt();
	}
	if (json['goodsSerialNumber'] != null) {
		data.goodsSerialNumber = json['goodsSerialNumber']?.toString();
	}
	if (json['oriPrice'] != null) {
		data.oriPrice = json['oriPrice']?.toDouble();
	}
	if (json['presentPrice'] != null) {
		data.presentPrice = json['presentPrice']?.toDouble();
	}
	if (json['comPic'] != null) {
		data.comPic = json['comPic']?.toString();
	}
	if (json['state'] != null) {
		data.state = json['state']?.toInt();
	}
	if (json['shopId'] != null) {
		data.shopId = json['shopId']?.toString();
	}
	if (json['goodsName'] != null) {
		data.goodsName = json['goodsName']?.toString();
	}
	if (json['goodsDetail'] != null) {
		data.goodsDetail = json['goodsDetail']?.toString();
	}
	return data;
}

Map<String, dynamic> goodsDetailGoodInfoToJson(GoodsDetailGoodInfo entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['image5'] = entity.image5;
	data['amount'] = entity.amount;
	data['image3'] = entity.image3;
	data['image4'] = entity.image4;
	data['goodsId'] = entity.goodsId;
	data['isOnline'] = entity.isOnline;
	data['image1'] = entity.image1;
	data['image2'] = entity.image2;
	data['TYPE_SHIP'] = entity.typeShip;
	data['goodsSerialNumber'] = entity.goodsSerialNumber;
	data['oriPrice'] = entity.oriPrice;
	data['presentPrice'] = entity.presentPrice;
	data['comPic'] = entity.comPic;
	data['state'] = entity.state;
	data['shopId'] = entity.shopId;
	data['goodsName'] = entity.goodsName;
	data['goodsDetail'] = entity.goodsDetail;
	return data;
}

goodsDetailGoodCommantsFromJson(GoodsDetailGoodCommants data, Map<String, dynamic> json) {
	if (json['SCORE'] != null) {
		data.sCORE = json['SCORE']?.toInt();
	}
	if (json['comments'] != null) {
		data.comments = json['comments']?.toString();
	}
	if (json['userName'] != null) {
		data.userName = json['userName']?.toString();
	}
	if (json['discussTime'] != null) {
		data.discussTime = json['discussTime']?.toInt();
	}
	return data;
}

Map<String, dynamic> goodsDetailGoodCommantsToJson(GoodsDetailGoodCommants entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['SCORE'] = entity.sCORE;
	data['comments'] = entity.comments;
	data['userName'] = entity.userName;
	data['discussTime'] = entity.discussTime;
	return data;
}

goodsDetailAdvertesPictureFromJson(GoodsDetailAdvertesPicture data, Map<String, dynamic> json) {
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

Map<String, dynamic> goodsDetailAdvertesPictureToJson(GoodsDetailAdvertesPicture entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['PICTURE_ADDRESS'] = entity.pictureAddress;
	data['TO_PLACE'] = entity.toPlace;
	data['urlType'] = entity.urlType;
	return data;
}