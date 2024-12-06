
import 'package:flutter/material.dart';
import 'package:mobilerush/weather/weatherapifetch.dart';
import 'package:mobilerush/weather model/weathermodel.dart';
import 'package:mobilerush/weather/weatherui.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherHome(),
    );
  }
}

class WeatherHome extends StatefulWidget {
  @override
  _WeatherHomeState createState() => _WeatherHomeState();
}

class _WeatherHomeState extends State<WeatherHome> {
  WeatherModel? weatherData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchWeather();
  }

  Future<void> fetchWeather() async {
    final weather = await WeatherAPI.fetchWeather();
    setState(() {
      weatherData = weather;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : WeatherUI(weather: weatherData!);
  }
}
