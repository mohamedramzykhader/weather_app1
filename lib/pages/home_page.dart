import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/searchpage.dart';
import 'package:weather_app/provider/weather_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherModel? weatherData;

  void updataUi() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context).weatherData;

    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (contex) {
                  return SearchPage(
                    updateUi: updataUi,
                  );
                }));
              }, icon: const Icon(Icons.search),)
          ],
          title: const Text('Weather App'),
        ),
        body: weatherData == null
            ? const Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'there is no weather 😵‍ start',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      'searching now 🔍',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    )
                  ],
                ),
              )
            : Container(
                decoration:BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        weatherData!.gerThemColor(),
                        weatherData!.gerThemColor()[300]!,
                        weatherData!.gerThemColor()[100]!,

                      ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,

                  )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(
                      flex: 3,
                    ),
                     Text(
                       Provider.of<WeatherProvider>(context).CityName!,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'updated: 12:15',
                      style: TextStyle(fontSize: 14),
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(weatherData!.getImage()),
                         Text(
                          '${weatherData!.temp.toInt()}', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                         Column(
                          children: [
                            Text(
                              'maxTemp: ${weatherData!.maxtemp.toInt()}', style: TextStyle(fontSize: 22),),
                            Text(
                              'minTemp: ${weatherData!.mintemp.toInt()}', style: TextStyle(fontSize: 22),),
                          ],
                        )
                      ],
                    ),
                    Spacer(),
                     Text(
                      weatherData!.weatherStateName,
                      style:
                          const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(
                      flex: 5,
                    ),
                  ],
                ),
              ));
  }
}
