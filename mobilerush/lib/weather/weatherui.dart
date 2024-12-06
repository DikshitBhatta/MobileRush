
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; 
import 'package:mobilerush/weather model/weathermodel.dart';
import 'package:mobilerush/recommendedplaces.dart'; 

class WeatherUI extends StatelessWidget {
  final WeatherModel weather;

  WeatherUI({required this.weather});

  @override
  Widget build(BuildContext context) {
    // Get today's date
    final DateTime now = DateTime.now();
    final String formattedDate = DateFormat('EEEE, d MMMM').format(now); 

    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: SafeArea(
        child: Column(
          children: [

            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.lightBlueAccent],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    weather.city,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${weather.temperature.toStringAsFixed(1)}°C',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      VerticalDivider(
                        color: Colors.white,
                        thickness: 1,
                        width: 20,
                      ),
                      Column(
                        children: [
                          Icon(Icons.circle, color: Colors.white, size: 30), 
                          Row(
                            children: [
                              Text(
                                weather.condition,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(width: 5),
                              Icon(Icons.cloud, color: Colors.white, size: 20), 
                            ],
                          ),
                          Text(
                            formattedDate,
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Feels Like ${weather.feelsLike.toStringAsFixed(1)}°C',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 30),


            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        WeatherDetailCard(
                          icon: Icons.water_drop,
                          value: '${weather.precipitationProbability.toStringAsFixed(1)}%',
                          label: 'Precipitation',
                        ),
                        WeatherDetailCard(
                          icon: Icons.air,
                          value: '${weather.windSpeed.toStringAsFixed(1)} km/hr',
                          label: 'Wind Speed',
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        WeatherDetailCard(
                          icon: Icons.thermostat,
                          value: '${weather.pressure.toStringAsFixed(0)} mm',
                          label: 'Atm Pressure',
                        ),
                        WeatherDetailCard(
                          icon: Icons.opacity,
                          value: '${weather.humidity}%',
                          label: 'Humidity',
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Text(
                      'Risk Factor: ${weather.riskFactor}',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RecommendedPlacesScreen(),
                          ),
                        );
                      },
                      child: Text('Recommended Places'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WeatherDetailCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  WeatherDetailCard({
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 40, color: Colors.blue),
        SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
