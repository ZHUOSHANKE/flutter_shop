import 'package:flutter_shop/entity/mall_category_entity.dart';

mallCategoryEntityFromJson(MallCategoryEntity data, Map<String, dynamic> json) {
	if (json['mallCategoryId'] != null) {
		data.mallCategoryId = json['mallCategoryId']?.toString();
	}
	if (json['mallCategoryName'] != null) {
		data.mallCategoryName = json['mallCategoryName']?.toString();
	}
	if (json['bxMallSubDto'] != null) {
		data.bxMallSubDto = new List<MallCategoryBxMallSubDto>();
		(json['bxMallSubDto'] as List).forEach((v) {
			data.bxMallSubDto.add(new MallCategoryBxMallSubDto().fromJson(v));
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

Map<String, dynamic> mallCategoryEntityToJson(MallCategoryEntity entity) {
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

mallCategoryBxMallSubDtoFromJson(MallCategoryBxMallSubDto data, Map<String, dynamic> json) {
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

Map<String, dynamic> mallCategoryBxMallSubDtoToJson(MallCategoryBxMallSubDto entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['mallSubId'] = entity.mallSubId;
	data['mallCategoryId'] = entity.mallCategoryId;
	data['mallSubName'] = entity.mallSubName;
	data['comments'] = entity.comments;
	return data;
}