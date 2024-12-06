
class WeatherModel {
  final String city;
  final double latitude;
  final double longitude;
  final double temperature;
  final double feelsLike;
  final String condition;
  final int riskFactor;
  final double precipitationProbability;
  final double windSpeed;
  final String windDirection;
  final double pressure;
  final int humidity;

  WeatherModel({
    required this.city,
    required this.latitude,
    required this.longitude,
    required this.temperature,
    required this.feelsLike,
    required this.condition,
    required this.riskFactor,
    required this.precipitationProbability,
    required this.windSpeed,
    required this.windDirection,
    required this.pressure,
    required this.humidity,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      city: json['location']['city'] ?? '',
      latitude: json['location']['latitude']?.toDouble() ?? 0.0,
      longitude: json['location']['longitude']?.toDouble() ?? 0.0,
      temperature: json['weather']['temperature']?.toDouble() ?? 0.0,
      feelsLike: json['weather']['feels_like']?.toDouble() ?? 0.0,
      condition: json['weather']['condition'] ?? '',
      riskFactor: json['weather']['risk_factor']?.toInt() ?? 0,
      precipitationProbability: json['weather']['precipitation_probability']?.toDouble() ?? 0.0,
      windSpeed: json['weather']['wind_speed']?.toDouble() ?? 0.0,
      windDirection: json['weather']['wind_direction'] ?? '',
      pressure: json['weather']['atm_pressure']?.toDouble() ?? 0.0,
      humidity: json['weather']['humidity']?.toInt() ?? 0,
    );
  }
}
