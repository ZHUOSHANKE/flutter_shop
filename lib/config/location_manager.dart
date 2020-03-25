import 'package:amap_base_location/amap_base_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/previde/location_provide.dart';
import 'package:provide/provide.dart';

class LocationManager {
  static LocationManager _INSTANCE = LocationManager();

  AMapLocation _aMapLocation;

  static LocationManager getInstance() => _INSTANCE;
  List<Location> _result = [];

  List<Location> get result => _result;

  LocationManager() {
    _aMapLocation = AMapLocation();
    _aMapLocation.init();
  }

  startLocation(
    BuildContext context,
  ) async {
    var locationClientOptions = LocationClientOptions(  isOnceLocation: false,
        locatingWithReGeocode: true, );
    if (await Permissions.requestMapPermission()) {
      _aMapLocation.getLocation(locationClientOptions).then((val){
        Provide.value<LocationProvide>(context).location = val;
      }).catchError((error) {
        Scaffold.of(context).showSnackBar(SnackBar(content: Text("定位失败")));
      });
    } else {
      Scaffold.of(context).showSnackBar(SnackBar(content: Text("权限不足")));
    }
  }

  destroy() {
    _aMapLocation.stopLocate();
  }
}
