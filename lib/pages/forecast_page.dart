import 'package:flutter/material.dart';

class ForecastPage extends StatelessWidget {
  final String kota;

  const ForecastPage({super.key, required this.kota});

  final List<Map<String, dynamic>> forecast = const [
    {"hari": "Senin", "cuaca": "Cerah", "suhu": 30},
    {"hari": "Selasa", "cuaca": "Hujan ringan", "suhu": 27},
    {"hari": "Rabu", "cuaca": "Berawan", "suhu": 28},
    {"hari": "Kamis", "cuaca": "Mendung", "suhu": 26},
    {"hari": "Jumat", "cuaca": "Cerah Berawan", "suhu": 29},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Perkiraan ~ $kota"),
        backgroundColor: Colors.pink,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: forecast.length,
        itemBuilder: (context, index) {
          final item = forecast[index];
          return Card(
            child: ListTile(
              title: Text(item["hari"]),
              subtitle: Text(item["cuaca"]),
              trailing: Text("${item['suhu']}°C"),
            ),
          );
        },
      ),
    );
  }
}