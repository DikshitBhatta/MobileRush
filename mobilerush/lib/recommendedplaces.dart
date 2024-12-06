import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class RecommendedPlacesScreen extends StatelessWidget {
  RecommendedPlacesScreen({super.key});

  final List<Map<String, dynamic>> places = [
    {
      'name': 'Kathmandu',
      'distance': '15 KM',
      'description': 'City full of temples and monkeys',
    },
    {
      'name': 'Chitwan',
      'distance': '50 KM',
      'description': 'Meet the wildlife',
    },
    {
      'name': 'Pokhara',
      'distance': '90 KM',
      'description': 'Tourist\'s hub',
    },
    {
      'name': 'Dhangadhi',
      'distance': '185 KM',
      'description': 'Beauty of Far-West',
    },
  ];

  final List<charts.Series<int, String>> rainData = [
    charts.Series<int, String>(
      id: 'Rain',
      data: [1, 3, 2, 5, 4, 5, 1],
      domainFn: (value, index) =>
          ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'][index!],
      measureFn: (value, index) => value,
      colorFn: (value, index) => index == 5
          ? charts.MaterialPalette.blue.shadeDefault 
          : charts.MaterialPalette.gray.shadeDefault, 
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recommended Places'),
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              color: Colors.red.withOpacity(0.2), 
              padding: const EdgeInsets.all(8.0),
              child: const Text(
                'Recommended Places',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: places.length,
                itemBuilder: (context, index) {
                  final place = places[index];
                  return ListTile(
                    leading: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        const CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/image.png'), 
                          radius: 30,
                        ),
                        Positioned(
                          top: -10,
                          left: -3, 
                          child: Image.asset(
                            'assets/Christmashat.png', 
                            width: 30,
                            height: 30,
                          ),
                        ),
                      ],
                    ),
                    title: Text(place['name']),
                    subtitle: Text(
                      '${place['distance']} • ${place['description']}',
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity, 
              color: Colors.red.withOpacity(0.2), 
              padding: const EdgeInsets.all(8.0),
              child: const Text(
                'Chances of rain',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 200,
              child: charts.BarChart(
                rainData,
                animate: true,
                vertical: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
