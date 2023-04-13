import 'dart:ffi';
import 'dart:io';

import 'package:best_weather_app/weather/data/weather_condition.dart';

class WeatherData {
  final String location;
  final WeatherCondition condition;
  final double temperatureInC;

  const WeatherData({
    required this.location,
    required this.condition,
    required this.temperatureInC,
  });
  
  factory WeatherData.fromJson(dynamic json) {
    stdout.writeln('condition: ${json['condition']}');
    final condition = WeatherCondition.values.firstWhere((element) => element.toString() == json['condition'], orElse: () => WeatherCondition.Sunny);

    return WeatherData(
      location: json['location'] as String, 
      condition: condition, 
      temperatureInC: json['temperature'].toDouble()
    );
  }
}