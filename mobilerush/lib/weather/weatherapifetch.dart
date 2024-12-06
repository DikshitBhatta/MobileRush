import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Weather> fetchWeather(String city) async {
  final response = await http.get(
    Uri.parse('https://mr-api-three.vercel.app/weather?city=$city'),
  );

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return Weather.fromJson(data);
  } else {
    throw Exception('Failed to load weather data');
  }
}
