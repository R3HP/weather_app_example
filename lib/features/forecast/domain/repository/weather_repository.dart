import 'package:weather_app_example/features/forecast/data/model/current_weather_data_model.dart';
import 'package:weather_app_example/features/forecast/data/model/forecast_day_weather_data_model.dart';

abstract class WeatherRepository{
  Future<CurrentWeatherDataModel> getCurrentWeatherForCity(String cityName);
  Future<List<ForecastDayWeatherDataModel>> getWeatherForecastList(String cityName,int forecastDays);
}