import 'package:flutter/material.dart';

Widget currentWeather(
    IconData icon, String temp, String location, String day, String main) {
  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(location,
            style: const TextStyle(
              fontSize: 40,
            )),
        const SizedBox(height: 10),
        Text(day,
            style: const TextStyle(
              fontSize: 20,
            )),
        const SizedBox(height: 20),
        Icon(
          icon,
          color: Colors.orangeAccent,
          size: 64,
        ),
        const SizedBox(height: 20),
        Text(
          '$temp | $main',
          style: const TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(height: 20),
      ],
    ),
  );
}
