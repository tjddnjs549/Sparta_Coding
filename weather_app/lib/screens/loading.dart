import 'package:flutter/material.dart';
import 'package:weather_app/data/mylocation.dart';
import 'package:weather_app/data/network.dart';
import 'package:weather_app/screens/weatherscreen.dart';

const apiKey = '083818f43b79bbf2ca057a299072663d';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  double? latitude3;
  double? longitude3;
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    MyLocation myLocation = MyLocation();
    await myLocation.getMyCurrentLocation();
    latitude3 = myLocation.latitude2;
    longitude3 = myLocation.longitude2;
    print(latitude3);
    print(longitude3);

    Network network = Network(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude3&lon=$longitude3&appid=$apiKey&units=metric');
    var weatherData = await network.getJsonData();
    print(weatherData);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return WeatherScreen(
          parseWeatherData: weatherData,
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(),
      ),
    );
  }
}
