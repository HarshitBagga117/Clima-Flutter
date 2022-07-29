import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
class Location{
  var _latitude;
  var _longitude;

  Future<void> getCurrentLocation()async{
    try {
      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw Future.error('Location permissions are denied');
        }
      }
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low,
          forceAndroidLocationManager: false);
      _latitude=position.latitude;
      _longitude=position.longitude;
    }catch(e){
      print(e);
    }
  }
  double getLatitude(){
    return _latitude;
  }
  double getLongitude(){
    return _longitude;
  }
}