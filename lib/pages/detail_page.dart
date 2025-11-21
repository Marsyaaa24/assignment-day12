import 'package:flutter/material.dart';
import '../models/weather_model.dart';

class DetailPage extends StatelessWidget {
  final WeatherModel weather;

  const DetailPage({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Cuaca"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Detail Kota: ${weather.kota}", style: const TextStyle(fontSize: 25)),
            Text("Kondisi: ${weather.kondisi}", style: const TextStyle(fontSize: 25)),
            Text("Suhu saat ini: ${weather.suhu}°C", style: TextStyle(fontSize: 25)),
            const SizedBox(height: 35),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Kembali"),
            ),
          ],
        ),
      ),
    );
  }
}