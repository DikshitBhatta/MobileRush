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
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    fetchWeather();
  }

  Future<void> fetchWeather() async {
    try {
      final weather = await WeatherAPI.fetchWeather();
      setState(() {
        weatherData = weather;
        isLoading = false;
      });
      print('Weather data: $weatherData');
    } catch (e) {
      setState(() {
        errorMessage = 'Error fetching weather data: $e';
        isLoading = false;
      });
      print('Error message: $errorMessage');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else if (errorMessage != null) {
      return Scaffold(
        body: Center(
          child: Text(errorMessage!),
        ),
      );
    } else if (weatherData != null) {
      return WeatherUI(weather: weatherData!);
    } else {
      return Scaffold(
        body: Center(
          child: Text('No weather data available.'),
        ),
      );
    }
  }
}
