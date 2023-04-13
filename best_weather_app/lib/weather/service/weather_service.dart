import 'dart:convert';

import 'package:flutter/services.dart';

import '../data/weather_data.dart';

class WeatherService {
  static const platform = MethodChannel('com.idunnololz.best_weather_app/weather');
  
  Future<WeatherData> fetchWeather() async {
    final String data = await platform.invokeMethod('fetchWeather');

    return WeatherData.fromJson(jsonDecode(data));
  }
}