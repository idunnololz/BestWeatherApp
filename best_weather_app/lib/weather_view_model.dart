import 'package:best_weather_app/weather/repository/weather_repository.dart';

class WeatherViewModel {

  final weatherRepository = WeatherRepository();

  Future<ViewModel> fetchWeather() async {
    final weatherData = await weatherRepository.fetchWeather();

    return ViewModel(
      weatherData.location, 
      weatherData.condition.name, 
      "${weatherData.temperatureInC.toStringAsPrecision(4)}° C",
    );
  }


}

class ViewModel {
  final String location;
  final String weatherCondition;
  final String temperature;

  ViewModel(this.location, this.weatherCondition, this.temperature);
}