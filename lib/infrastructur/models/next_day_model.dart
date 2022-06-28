class NextDayModel {
  final String dateTime;
  final String temp;

  NextDayModel({required this.dateTime, required this.temp});

  factory NextDayModel.fromJson(Map<String, dynamic> json) {
    var f = json['dt_text'].split(' ')[0].split('-')[2];
    var l = json['dt_text'].split(' ')[1].split(':')[0];
    var fandl = '$f/$l';

    return NextDayModel(
      dateTime: '$fandl',
      temp: json['main']['temp'].toString(),
    );
  }
}
