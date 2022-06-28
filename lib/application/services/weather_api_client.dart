import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:weather_app/infrastructur/models/next_day_model.dart';
import 'package:weather_app/infrastructur/models/weather_model.dart';

const String apiKey = 'YOUR_API_KEY';

class WeatherApiClient {
  //String? location
  Future<WeatherModel>? getCurrentWeather() async {
    var url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=49.872826&lon=8.651193&appid=$apiKey&&units=metric&cnt=7');

    final response = await http.get(url);
    var body = jsonDecode(response.body);
    print(WeatherModel.fromJson(body).cityName);
    var date = DateTime.fromMillisecondsSinceEpoch(
        WeatherModel.fromJson(body).dt * 1000);
    var d24 = DateFormat('dd/MM/yyyy, HH:mm').format(date);
    print(d24);
    print(WeatherModel.fromJson(body).dtText);

    return WeatherModel.fromJson(body);
  }

  Future<WeatherModel>? getNextDayWeather() async {
    var url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?lat=49.872826&lon=8.651193&appid=$apiKey&&units=metric&cnt=7');

    final response = await http.get(url);
    var body = jsonDecode(response.body);
    NextDayModel.fromJson(body);
    print(NextDayModel.fromJson(body).dateTime);
    print('check');
    return WeatherModel.fromJson(body);
  }
}
