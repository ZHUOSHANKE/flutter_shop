import 'package:flutter_shop/generated/json/base/json_convert_content.dart';

class MallGoodsEntity with JsonConvert<MallGoodsEntity> {
	String image;
	double oriPrice;
	double presentPrice;
	String goodsName;
	String goodsId;
}
