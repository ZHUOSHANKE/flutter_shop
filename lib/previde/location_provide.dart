import 'package:amap_base_location/amap_base_location.dart';
import 'package:flutter/material.dart';

class LocationProvide with ChangeNotifier {
  List<Location> _listLocation = [];
  Location _location;

  List<Location> get listLocation => _listLocation;

  Location get location => _location;

  set listLocation(List<Location> value) {
    _listLocation = value;
    if (_listLocation.isEmpty) {
      notifyListeners();
    }
  }

  set location(Location value) {
    _location = value;
    if (_location.city != value.city) {
      notifyListeners();
    }
  }
}
