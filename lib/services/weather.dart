import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/utilities/apiKey.dart';

import '../utilities/apiKey.dart';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var apiUrl =
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$openWeatherMapApiKey&units=metric';
    Networking networking = Networking(apiUrl);

    //Make API Call
    var weatherData = await networking.getWeatherApiData();

    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    print('getLocation');
    //Get User Location and wait for result
    await location.getLocation();

    var apiUrl =
        'https://api.openweathermap.org/data/2.5/onecall?lat=${location.latitude}&lon=${location.longitude}&exclude=&appid=$openWeatherMapApiKey&units=metric';

    if (location.cityName != null && location.cityName != '') {
      apiUrl =
          'https://api.openweathermap.org/data/2.5/weather?q=${location.cityName}&appid=$openWeatherMapApiKey&units=metric';
    }
    Networking networking = Networking(apiUrl);

    //Make API Call
    var weatherData = await networking.getWeatherApiData();

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
