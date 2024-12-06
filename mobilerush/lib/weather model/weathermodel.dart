class Weather {
  final String city;
  final String description;
  final double temperature;
  final double feelsLike;
  final double windSpeed;
  final int humidity;
  final double precipitation;
  final double pressure;

  Weather({
    required this.city,
    required this.description,
    required this.temperature,
    required this.feelsLike,
    required this.windSpeed,
    required this.humidity,
    required this.precipitation,
    required this.pressure,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      city: json['city'],
      description: json['description'],
      temperature: json['temperature'].toDouble(),
      feelsLike: json['feelsLike'].toDouble(),
      windSpeed: json['windSpeed'].toDouble(),
      humidity: json['humidity'].toInt(),
      precipitation: json['precipitation'].toDouble(),
      pressure: json['pressure'].toDouble(),
    );
  }
}
