import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Services/weather_servic.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/provider/weather_provider.dart';



class SearchPage extends StatelessWidget {
  String? CityName;

  SearchPage({Key? key, this.updateUi}) : super(key: key);

  VoidCallback? updateUi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search a City"),
        backgroundColor: Colors.orange,
      ),
      body: Center(
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                  onSubmitted: (data) async {
                    CityName = data;
                    WeatherService service = WeatherService();

                    WeatherModel weather =
                        await service.GetWather(CityName: CityName!);

                       Provider.of<WeatherProvider>(context,listen: false).WeatherData =weather ;
                    Provider.of<WeatherProvider>(context,listen: false).CityName = CityName ;

                    Navigator.pop(context);
                  },
                  decoration: const InputDecoration(
                    fillColor: Colors.orange,
                    label: Text("search"),
                    border: OutlineInputBorder(),
                    hintText: 'Inter A City',
                    suffix: Icon(Icons.search),
                  )))),
    );
  }
}