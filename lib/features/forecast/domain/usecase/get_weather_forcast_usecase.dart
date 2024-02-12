// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:weather_app_example/features/forecast/data/model/forecast_day_weather_data_model.dart';
import 'package:weather_app_example/features/forecast/domain/repository/weather_repository.dart';

class GetWeatherForecastUsecase {
  final WeatherRepository weatherRepository;

  GetWeatherForecastUsecase({
    required this.weatherRepository,
  });


  Future<List<ForecastDayWeatherDataModel>> call(String? cityName,int? forecastDays) async {
    try {
      final response = await weatherRepository.getWeatherForecastList(cityName ?? 'Tehran', forecastDays ?? 3);
      return response; 
    } catch (e) {
      rethrow;
    }
  }
}
