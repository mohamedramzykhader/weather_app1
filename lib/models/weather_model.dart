import 'package:flutter/material.dart';

class WeatherModel {
   String date;
   double temp;
   double maxtemp;
   double mintemp;
   String weatherStateName;

  WeatherModel(
      {required this.weatherStateName,
      required this.date,
      required this.temp,
      required this.maxtemp,
      required this.mintemp});

  factory WeatherModel.fromjson(dynamic data){
    var JsonData = data ['forecast']['forecastday'][0]['day'];
    return WeatherModel(
    date: data['location']["localtime"],
    temp: JsonData["avgtemp_c"],
    maxtemp: JsonData['maxtemp_c'],
    mintemp: JsonData['mintemp_c'],
    weatherStateName: JsonData['condition']['text']);


  }

   String getImage(){
     if (weatherStateName == 'clear'|| weatherStateName== "light cloud" ){
       return ("assets/images/clear.png");
     } else if (weatherStateName == 'rainy'){
       return ("assets/images/rainy.png");
     }else if (weatherStateName == 'snow'){
       return ("assets/images/snow.png");}
     else {
       return ('assets/images/clear.png');
       }
       }

   MaterialColor gerThemColor(){
     if (weatherStateName == 'clear'|| weatherStateName== "light cloud" ){
       return Colors.orange;
     } else if (weatherStateName == 'rainy'){
       return Colors.blue;
     }else if (weatherStateName == 'snow'){
       return Colors.blue;}
     else {
       return Colors.yellow;
     }
   }

}



