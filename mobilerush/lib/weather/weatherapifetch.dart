// weather_fetch_api.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobilerush/weather model/\weathermodel.dart';

class WeatherAPI {
  static const String baseUrl = 'https://mr-api-three.vercel.app/weather';

  static Future<WeatherModel?> fetchWeather() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print('API Response: $data'); // Debugging
        return WeatherModel.fromJson(data);
      } else {
        print('Failed to load weather data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching weather data: $e');
    }
    return null;
  }
}
