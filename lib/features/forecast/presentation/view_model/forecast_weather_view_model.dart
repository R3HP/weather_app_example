import 'package:weather_app_example/features/forecast/presentation/view_model/hour_weather_view_model.dart';

import '../../data/model/hour_weather_data_model.dart';
import 'package:intl/intl.dart';

class ForecastWeatherViewModel {
  final DateTime _date;
  final double _maxTempCelcius;
  final double _minTempCelcius;
  final double _avgTempCelcius;
  final int _chanceOfRain;
  final int _chanceOfSnow;
  final String _condition;
  final String _conditionIconPath;
  
  final List<HourWeatherDataModel> _hoursWeatherData;

  ForecastWeatherViewModel(
      {required DateTime date,
      required double maxTempCelcius,
      required double minTempCelcius,
      required double avgTempCelcius,
      required int chanceOfRain,
      required int chanceOfSnow,
      required String condition,
      required String conditionIconPath,
      
      required List<HourWeatherDataModel> hoursWeatherData})
      : _date = date,
        _maxTempCelcius = maxTempCelcius,
        _minTempCelcius = minTempCelcius,
        _avgTempCelcius = avgTempCelcius,
        _chanceOfRain = chanceOfRain,
        _chanceOfSnow = chanceOfSnow,
        _condition = condition,
        _conditionIconPath = conditionIconPath,
        _hoursWeatherData = hoursWeatherData;

  String get date => DateFormat('EEE,d MMMM,').format(_date);

  String get weekDay => DateFormat(DateFormat.WEEKDAY).format(_date);

  String get maxTempCelcius => _maxTempCelcius.toStringAsFixed(1);

  String get minTempCelcius => _minTempCelcius.toStringAsFixed(1);

  String get avgTempCelcius => _avgTempCelcius.toStringAsFixed(1);

  String get chanceOfRain => '$_chanceOfRain %';

  String get chanceOfSnow => '$_chanceOfSnow %';

  String get condition => _condition;

  

  String get conditionIconPath => _conditionIconPath;

  String get localAssetIconPath {
    var pathParts = _conditionIconPath.split('/');
    return 'assets/images/${pathParts[pathParts.length - 2]}/${pathParts.last}';
  }

  List<HourWeatherViewModel> get hoursWeather => _hoursWeatherData
      .map((e) => HourWeatherViewModel(
          time: e.time,
          tempCelcius: e.tempCelcius,
          isDay: e.isDay,
          condition: e.condition,
          conditionIconPath: e.conditionIconPath,
          feelsLikeTemplCelcius: e.feelsLikeTemplCelcius,
          chanceOfRain: e.chanceOfRain,
          chanceOfSnow: e.chanceOfSnow))
      .toList();
}
