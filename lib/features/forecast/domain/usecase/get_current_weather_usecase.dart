// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:weather_app_example/features/forecast/data/model/current_weather_data_model.dart';

import '../repository/weather_repository.dart';

class GetCurrentWeatherUsecase {
  final WeatherRepository weatherRepository;
  GetCurrentWeatherUsecase({
    required this.weatherRepository,
  });

  Future<CurrentWeatherDataModel> call(String? cityName) async {
    try {
      final response = await weatherRepository.getCurrentWeatherForCity(cityName ?? 'Tehran');
      return response;
    } catch (e) {
      rethrow;
    }
  }

}
