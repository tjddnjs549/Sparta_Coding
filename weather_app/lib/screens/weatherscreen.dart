import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timer_builder/timer_builder.dart';

import '../data/mylocation.dart';
import '../data/network.dart';

const apiKey = '083818f43b79bbf2ca057a299072663d';

class WeatherScreen extends StatefulWidget {
  WeatherScreen({this.parseWeatherData});
  final dynamic parseWeatherData;
  @override
  State<WeatherScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<WeatherScreen> {
  double? latitude3;
  double? longitude3;

  String? cityname;
  double? temp;
  dynamic des;
  var date = DateTime.now();
  @override
  void initState() {
    super.initState();
    getLocation(widget.parseWeatherData);
    //updateData(widget.parseWeatherData);
  }

  void getLocation(dynamic weatherData) async {
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
    double temp2 = weatherData['main']['temp'];
    temp = temp2.roundToDouble();
    cityname = weatherData['name'];
    des = weatherData['weather'][0]['description'];

    print(cityname);
    print(temp);
    print(des);
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) {
    //     return WeatherScreen(
    //       parseWeatherData: weatherData,
    //     );
    //   }),
    // );
  }

  void updateData(dynamic weatherData) {
    double temp2 = weatherData['main']['temp'];
    temp = temp2.roundToDouble();
    cityname = weatherData['name'];
    des = weatherData['weather'][0]['description'];

    print(cityname);
    print(temp);
    print(des);
  }

  String getSystemTime() {
    var now = DateTime.now();
    return DateFormat(" h : mm a").format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[400],
      appBar: AppBar(
        title: Text(
          '현재 위치 날씨',
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 0, 120),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$cityname',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Row(
                  children: [
                    TimerBuilder.periodic(
                      (Duration(minutes: 1)),
                      builder: (context) {
                        print('${getSystemTime()}');
                        return Text(
                          getSystemTime(),
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        );
                      },
                    ),
                    Text(
                      DateFormat(' - EEEE').format(date),
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      DateFormat(' d MMM, yyy').format(date),
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Column(
                  children: [
                    Text(
                      '$temp\u2103',
                      style: TextStyle(
                        fontSize: 80,
                        fontWeight: FontWeight.w200,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Row(
                  children: [
                    Text(
                      '$des',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
