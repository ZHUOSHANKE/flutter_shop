import 'package:flutter_shop/entity/mall_goods_entity.dart';

mallGoodsEntityFromJson(MallGoodsEntity data, Map<String, dynamic> json) {
	if (json['image'] != null) {
		data.image = json['image']?.toString();
	}
	if (json['oriPrice'] != null) {
		data.oriPrice = json['oriPrice']?.toDouble();
	}
	if (json['presentPrice'] != null) {
		data.presentPrice = json['presentPrice']?.toDouble();
	}
	if (json['goodsName'] != null) {
		data.goodsName = json['goodsName']?.toString();
	}
	if (json['goodsId'] != null) {
		data.goodsId = json['goodsId']?.toString();
	}
	return data;
}

Map<String, dynamic> mallGoodsEntityToJson(MallGoodsEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['image'] = entity.image;
	data['oriPrice'] = entity.oriPrice;
	data['presentPrice'] = entity.presentPrice;
	data['goodsName'] = entity.goodsName;
	data['goodsId'] = entity.goodsId;
	return data;
}