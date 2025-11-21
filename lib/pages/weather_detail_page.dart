import 'package:flutter/material.dart';

class WeatherDetailPage extends StatelessWidget {
  final Map data;

  const WeatherDetailPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail ~ ${data['kota']}"),
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(data['icon'], width: 120),
            const SizedBox(height: 20),
            Text("Kota: ${data['kota']}", style: const TextStyle(fontSize: 22)),
            Text("Cuaca: ${data['kondisi']}", style: const TextStyle(fontSize: 22)),
            Text("Suhu: ${data['suhu']}°C", style: const TextStyle(fontSize: 22)),
            const SizedBox(height: 30),
            const Text(
              "Penjelasan Cuaca:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "Cuaca hari ini cukup stabil, tidak ada fenomena extrem yang perlu dikhawatirkan.",
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}