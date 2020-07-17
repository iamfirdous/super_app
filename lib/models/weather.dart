import 'package:super_app/util/constants.dart';

class Weather {
  String city;
  String icon;
  String tempC;
  String tempF;
  String text;
  String description;
  String background;
  bool hasData;

  Weather({
    this.city = '',
    this.icon = '',
    this.tempC = '',
    this.tempF = '',
    this.text = '',
    this.description = '',
    this.background = '',
    this.hasData,
  });

  factory Weather.fromJson({Map<String, dynamic> json, String code}) {
    if (json != null) {
      dynamic tempC = json['main']['temp'];
      double tempF = (tempC * 9 / 5) + 32;
      String icon = json['weather'][0]['icon'] as String;
      return Weather(
        hasData: true,
        city: json['name'] as String,
        icon: '${Constants.WEATHER_ICONS_PATH}$icon.png',
        tempC: '${tempC.toInt()}°C',
        tempF: '${tempF.toInt()}°C',
        text: json['weather'][0]['main'] as String,
        description: json['weather'][0]['description'] as String,
        background:
            '${Constants.IMAGES_PATH}${icon.endsWith('d') ? 'day' : 'night'}-bg.jpg',
      );
    } else {
      return Weather(
        hasData: false,
        background: '${Constants.IMAGES_PATH}day-bg.jpg',
        icon: '${Constants.WEATHER_ICONS_PATH}error.png',
        tempC: 'Oops!',
        tempF: 'Oops!',
        text: code ?? 'Something went wrong',
      );
    }
  }
}
