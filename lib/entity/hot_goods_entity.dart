import 'package:flutter_shop/generated/json/base/json_convert_content.dart';

class HotGoodsEntity with JsonConvert<HotGoodsEntity> {
	String name;
	String image;
	double mallPrice;
	String goodsId;
	double price;
}
