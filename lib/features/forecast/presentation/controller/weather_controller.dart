// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:weather_app_example/features/forecast/domain/usecase/get_current_weather_usecase.dart';
import 'package:weather_app_example/features/forecast/domain/usecase/get_weather_forcast_usecase.dart';
import 'package:weather_app_example/features/forecast/presentation/view_model/current_weather_view_model.dart';
import 'package:weather_app_example/features/forecast/presentation/view_model/forecast_weather_view_model.dart';

class WeatherController {
  final GetCurrentWeatherUsecase getCurrentWeatherUsecase;
  final GetWeatherForecastUsecase getWeatherForecastUsecase;

  WeatherController({
    required this.getCurrentWeatherUsecase,
    required this.getWeatherForecastUsecase,
  });

  Future<CurrentWeatherViewModel> getCurrentWeather({String? city}) async {
    try {
      final currentWeatherData = await getCurrentWeatherUsecase(city);
      return CurrentWeatherViewModel(
          tempCelcius: currentWeatherData.tempCelcius,
          isDay: currentWeatherData.isDay,
          city: currentWeatherData.city,
          region: currentWeatherData.region,
          country: currentWeatherData.country,
          condition: currentWeatherData.condition,
          conditionIconPath: currentWeatherData.conditionIconPath,
          feelsLikeTemplCelcius: currentWeatherData.feelsLikeTemplCelcius);
    } catch (e) {
      rethrow;
    }
  }

  Future<List<ForecastWeatherViewModel>> getWeatherForecastForDays(
      {String? city, int? days = 3}) async {
    try {
      final weatherForecastDataList =
          await getWeatherForecastUsecase(city, days);
      return weatherForecastDataList
          .map((e) => ForecastWeatherViewModel(
              date: e.date,
              maxTempCelcius: e.maxTempCelcius,
              minTempCelcius: e.minTempCelcius,
              avgTempCelcius: e.avgTempCelcius,
              chanceOfRain: e.chanceOfRain,
              chanceOfSnow: e.chanceOfSnow,
              condition: e.condition,
              conditionIconPath: e.conditionIconPath,
              hoursWeatherData: e.hoursWeatherData))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<(CurrentWeatherViewModel, List<ForecastWeatherViewModel>)>
      getCurrentAndForecastWeather(
          {String? city = 'Rasht', int? forecastDays = 3}) async {
    try {
      final responses = await Future.wait([
        getCurrentWeather(city: city),
        getWeatherForecastForDays(city: city, days: forecastDays)
      ]);

      return (
        responses.first as CurrentWeatherViewModel,
        responses[1] as List<ForecastWeatherViewModel>
      );
    } catch (e) {
      throw e.toString();
    }
  }
}
