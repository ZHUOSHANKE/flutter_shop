import 'package:flutter_shop/entity/hot_goods_entity.dart';

hotGoodsEntityFromJson(HotGoodsEntity data, Map<String, dynamic> json) {
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['image'] != null) {
		data.image = json['image']?.toString();
	}
	if (json['mallPrice'] != null) {
		data.mallPrice = json['mallPrice']?.toDouble();
	}
	if (json['goodsId'] != null) {
		data.goodsId = json['goodsId']?.toString();
	}
	if (json['price'] != null) {
		data.price = json['price']?.toDouble();
	}
	return data;
}

Map<String, dynamic> hotGoodsEntityToJson(HotGoodsEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['name'] = entity.name;
	data['image'] = entity.image;
	data['mallPrice'] = entity.mallPrice;
	data['goodsId'] = entity.goodsId;
	data['price'] = entity.price;
	return data;
}