
import 'package:flutter/cupertino.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  // ignore: non_constant_identifier_names
  WeatherModel? _WeatherData;

  String? CityName;
  set WeatherData(WeatherModel? weather){
   _WeatherData = weather;
   notifyListeners();
  }
  WeatherModel? get weatherData => _WeatherData;
}