// ignore_for_file: deprecated_member_use

import 'package:clima/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apiKey='3ebebbb9699699b7df883da3f7d7c8f1';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  String longitude;
  String latitude;
  void getLocationData() async {
   WeatherModel weather=WeatherModel();
   var weatherData=await weather.getLocationWeather();
   print(weatherData);
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context)=>LocationScreen(locationWeather: weatherData))
    );
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child:SpinKitDoubleBounce(
          color: Colors.red,
          size:100.0,
        ) ,
      ),
    );
  }
}


