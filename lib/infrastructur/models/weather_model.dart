class WeatherModel {
  String cityName; //Location
  double temp;
  double maxTemp;
  double minTemp;
  int humidity;
  double wind;

  String main;
  String description;
  String icon;

  int dt;
  String? dtText;

  WeatherModel({
    required this.cityName,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.humidity,
    required this.main,
    required this.description,
    required this.icon,
    required this.wind,
    required this.dt,
    this.dtText,
  });

  //parse the JSON into Model
  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['name'],
      temp: json['main']['temp'],
      maxTemp: json['main']['temp_max'],
      minTemp: json['main']['temp_min'],
      humidity: json['main']['humidity'],
      main: json['weather'][0]['main'],
      description: json['weather'][0]['description'],
      icon: json['weather'][0]['icon'],
      wind: json['wind']['speed'],
      dt: json['dt'],
      dtText: json['dt_txt'],
    );
  }
}
