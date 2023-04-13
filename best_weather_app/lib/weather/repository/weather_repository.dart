import 'package:best_weather_app/weather/service/weather_service.dart';

import '../data/weather_data.dart';

class WeatherRepository {
  final weatherService = WeatherService();

  Future<WeatherData> fetchWeather() async {
    return weatherService.fetchWeather();
  }
}