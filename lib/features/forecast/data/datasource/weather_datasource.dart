// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:weather_app_example/core/services/webservice/web_service.dart';
import 'package:weather_app_example/features/forecast/data/model/current_weather_data_model.dart';
import 'package:weather_app_example/features/forecast/data/model/forecast_day_weather_data_model.dart';

abstract class WeatherDataSource {
  Future<CurrentWeatherDataModel> getCurrentWeatherData(String cityName);
  Future<List<ForecastDayWeatherDataModel>> getWeatherForecast(String cityName, int forcastDays);
}

class WeatherDataSourceImpl implements WeatherDataSource {
  WeatherDataSourceImpl({
    required this.webService
  });
  
  final WebService webService;

  @override
  Future<CurrentWeatherDataModel> getCurrentWeatherData(String cityName) async {
    try {
      // final s = 'http://api.weatherapi.com/v1/current.json?key=39dad403212a49bbbf4152201240502&q=$cityName&aqi=no';
      final url = Uri.http('api.weatherapi.com', '/v1/current.json', {
        'key': '39dad403212a49bbbf4152201240502',
        'q': cityName,
        'aqi': 'no'
      });
      final response = await webService.getUri(uri: url);
      debugPrint(response.toString());
      return CurrentWeatherDataModel.fromMap(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<ForecastDayWeatherDataModel>> getWeatherForecast(String cityName, int forcastDays) async {
    try {
      // final url = Uri.parse('http://api.weatherapi.com/v1/forecast.json?key=39dad403212a49bbbf4152201240502&q=London&days=5&aqi=no&alerts=no');
      final url = Uri.http('api.weatherapi.com', '/v1/forecast.json', {
        'key': '39dad403212a49bbbf4152201240502',
        'days': '$forcastDays',
        'q': cityName,
        'aqi': 'no'
      });
      final response = await webService.getUri(uri: url);
      
      debugPrint(response.data.runtimeType.toString());
      final responseData = response.data as Map<String,dynamic>;
      final forcastDayList = responseData["forecast"]!["forecastday"] as List<dynamic>;
      final forecastDayWeatherDataModelList = forcastDayList.map((e) => ForecastDayWeatherDataModel.fromMap(e)).toList();
      return forecastDayWeatherDataModelList;
    } catch (e) {
      rethrow;
    }
  }
}
