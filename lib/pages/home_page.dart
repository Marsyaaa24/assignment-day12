import 'dart:ui';
import 'package:flutter/material.dart';
// import '../models/weather_model.dart';
// import 'detail_page.dart';
import 'forecast_page.dart';
import 'package:weather_app_marsya2/pages/weather_detail_page.dart';





class HomePage  extends StatelessWidget {
  final List<Map<String, dynamic>> weatherList = [
    {
      'kota' : 'Padang',
      'kondisi' : 'Berawan',
      'suhu' : 27,
      'icon' : 'assets/icons/cloud.png',
    },
    {
      'kota' : 'Jakarta',
      'kondisi' : 'Hujan Ringan',
      'suhu' : 25,
      'icon' : 'assets/icons/cloud.png',
    },
    {
      'kota' : 'Bandung',
      'kondisi' : 'Cerah',
      'suhu' : 29,
      'icon' : 'assets/icons/sun.png',
    },
    {
      'kota' : 'Bali',
      'kondisi' : 'Panas Terik',
      'suhu' : 31,
      'icon' : 'assets/icons/hot.png',
    },
  ];

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("Weather App Marsyaaa"),
        backgroundColor: const Color.fromARGB(255, 236, 175, 195),
        elevation: 0,
      ),
      body: Stack(
        children: [
          _buildGradientBackground(),
          ListView.builder(
            padding: const EdgeInsets.only(top: 100, left: 16, right: 16),
            itemCount: weatherList.length,
            itemBuilder: (context, index) {
              final data = weatherList[index];
              return _weatherCard(context, data);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildGradientBackground() {
    return Container(
      decoration:  const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color.fromARGB(255, 211, 3, 197), Color.fromARGB(255, 255, 189, 253)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    );
  }

  Widget _weatherCard(BuildContext context, Map data) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withOpacity(0.3)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(data['icon'], width: 50),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['kota'],
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        data['kondisi'],
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "${data['suhu']}°C",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 16),

              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.pink,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => WeatherDetailPage(data: data),
                          ),
                        );
                      },
                      child: const Text("Detail cuaca"),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.pink,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ForecastPage(kota: data['kota']),
                          ),
                        );
                      },
                      child: const Text("Perkiraan"),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ),
  );
}

}