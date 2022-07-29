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
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
