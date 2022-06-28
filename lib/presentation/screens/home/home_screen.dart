import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/application/services/weather_api_client.dart';
import 'package:weather_app/infrastructur/models/next_day_model.dart';
import 'package:weather_app/presentation/screens/home/widgets/current_weather.dart';
import 'package:weather_app/presentation/screens/home/widgets/weather_information.dart';

import '../../../infrastructur/models/weather_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherApiClient client = WeatherApiClient();
  WeatherModel? weatherModelData;
  NextDayModel? nextDayModelData;

  Future<void> getData() async {
    weatherModelData = await client.getCurrentWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              children: <Widget>[
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      currentWeather(
                        Icons.sunny,
                        '${weatherModelData!.temp.toStringAsFixed(0)} °C',
                        weatherModelData!.cityName,
                        DateFormat().add_EEEE().format(DateTime.now()),
                        weatherModelData!.main,
                      ),
                      const SizedBox(height: 10),
                      const Divider(
                        indent: 20,
                        endIndent: 20,
                        color: Colors.white,
                        thickness: 1,
                      ),
                      const SizedBox(height: 10),
                      const Text('Weather Information',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      WeatherInformation(
                        '${weatherModelData!.wind} km/h',
                        '${weatherModelData!.humidity} %',
                        '${weatherModelData!.minTemp} °C',
                        '${weatherModelData!.maxTemp} °C',
                      ),
                      const Divider(
                        indent: 20,
                        endIndent: 20,
                        color: Colors.white,
                        thickness: 1,
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                openDialog();
                              },
                              icon: const ImageIcon(
                                AssetImage('assets/img/gelb.png'),
                                color: Colors.yellow,
                                size: 50,
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Text('Show more Details'),
                          ],
                        ),
                      ),
                    ])
              ],
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ErrorWidget(context);
          }
        },
      ),
    );
  }

  Future openDialog() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text('${weatherModelData!.cityName}'),
            content: SizedBox(
              height: MediaQuery.of(context).size.height / 2.6,
              width: double.infinity / 3,
              child: Column(children: [
                const Text('Work in progress'),
                const SizedBox(height: 30),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close),
                  color: Colors.red,
                )
              ]),
            ),
          ));
}
