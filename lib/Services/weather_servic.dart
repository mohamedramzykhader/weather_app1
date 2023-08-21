import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  String BaseUrl = "http://api.weatherapi.com/v1";

  String ApiKey = 'd60e4b1c23234ad48fa151808230808';

  Future<WeatherModel> GetWather({required String CityName}) async
  {
    Uri url = Uri.parse(
        '$BaseUrl/forecast.json?key=$ApiKey&q=$CityName&days=7');
    http.get(url);
    http.Response response = await http.get(url);

    Map<String, dynamic> data = jsonDecode(response.body);




    WeatherModel weather =WeatherModel.fromjson(data);
    return weather;
  }
}