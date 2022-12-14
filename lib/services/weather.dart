import 'package:clima/services/location.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/networking.dart';
class WeatherModel {
  Future getCityWeather(String loc)async{
    JsonData weatherData = await JsonData(longitude: '0',latitude: '0').getCityData(loc);
    return weatherData;
  }
  Future getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    String latitude = location.getLatitude().toString();
    String longitude = location.getLongitude().toString();
    JsonData json = JsonData(latitude: latitude, longitude: longitude);
    var weatherData = await json.getData();
    return weatherData;
  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
