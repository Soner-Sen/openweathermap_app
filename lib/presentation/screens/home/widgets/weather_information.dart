import 'package:flutter/widgets.dart';

Widget WeatherInformation(
    String wind, String humidity, String lowestTemp, String maxTemp) {
  return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text('wind', style: TextStyle(fontSize: 18)),
              Text(wind, style: const TextStyle(fontSize: 18)),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text('humidity', style: TextStyle(fontSize: 18)),
              Text(humidity, style: const TextStyle(fontSize: 18)),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text('min Temp', style: TextStyle(fontSize: 18)),
              Text(lowestTemp, style: const TextStyle(fontSize: 18)),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text('max Temp', style: TextStyle(fontSize: 18)),
              Text(maxTemp, style: const TextStyle(fontSize: 18))
            ],
          ),
        ],
      ));
}
