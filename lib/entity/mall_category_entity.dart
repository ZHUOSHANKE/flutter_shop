import 'package:flutter_shop/generated/json/base/json_convert_content.dart';

class MallCategoryEntity with JsonConvert<MallCategoryEntity> {
	String mallCategoryId;
	String mallCategoryName;
	List<MallCategoryBxMallSubDto> bxMallSubDto;
	dynamic comments;
	String image;
}

class MallCategoryBxMallSubDto with JsonConvert<MallCategoryBxMallSubDto> {
	String mallSubId;
	String mallCategoryId;
	String mallSubName;
	String comments;
}
