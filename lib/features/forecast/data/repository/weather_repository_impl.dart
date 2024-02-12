// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:weather_app_example/features/forecast/data/model/current_weather_data_model.dart';
import 'package:weather_app_example/features/forecast/data/model/forecast_day_weather_data_model.dart';
import 'package:weather_app_example/features/forecast/domain/repository/weather_repository.dart';

import '../datasource/weather_datasource.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherDataSource weatherDataSource;

  WeatherRepositoryImpl({
    required this.weatherDataSource,
  });
  
  @override
  Future<CurrentWeatherDataModel> getCurrentWeatherForCity(String cityName) async {
    try {
      final response = await weatherDataSource.getCurrentWeatherData(cityName);
      return response;
    } catch (e) {
      rethrow;
    }
  }
  
  @override
  Future<List<ForecastDayWeatherDataModel>> getWeatherForecastList(String cityName, int forecastDays) async {
    try {
      final response = await weatherDataSource.getWeatherForecast(cityName,forecastDays);
      return response;
    } catch (e) {
      rethrow;
    }
  }


}
