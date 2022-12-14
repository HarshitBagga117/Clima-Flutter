// ignore_for_file: deprecated_member_use

import 'package:clima/screens/city_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';




class LocationScreen extends StatefulWidget {
  final locationWeather;
  LocationScreen({this.locationWeather});
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather=WeatherModel();
   double temp;
   int condition;
  String cityName="";
  String icon="";
  String message="";
  @override
  void initState() {
    super.initState();
     updateUI(widget.locationWeather);
  }
  void updateUI (dynamic weatherData){

    setState(() {
    temp=weatherData['main']['temp'];
    int temperature=temp.toInt();
    cityName=weatherData['name'];
    condition=weatherData['weather'][0]['id'];
    icon=weather.getWeatherIcon(condition);
    message=weather.getMessage(temperature);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                    onPressed: ()async {
                      var weatherData=await weather.getLocationWeather();
                      updateUI(weatherData);
                    },
                    icon: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  IconButton(
                    onPressed: ()async {
                      String typedName=await Navigator.push(context, MaterialPageRoute(builder: (context)=>CityScreen()));
                      if(typedName!=null){
                        var weatherData=await weather.getCityWeather(typedName);
                        updateUI(weatherData);
                      }

                    },
                    icon: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      "${temp.toStringAsFixed(0)}??",
                      style: kTempTextStyle,
                    ),
                    Text(
                      "$icon",
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                 "$message in $cityName",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
