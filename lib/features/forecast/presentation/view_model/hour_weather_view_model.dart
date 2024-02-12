import 'package:intl/intl.dart';

class HourWeatherViewModel {
  final DateTime _time;
  final double _tempCelcius;
  final bool _isDay;
  final String _condition;
  final String _conditionIconPath;
  final double _feelsLikeTemplCelcius;
  final int _chanceOfRain;
  final int _chanceOfSnow;

  HourWeatherViewModel(
      {required DateTime time,
      required double tempCelcius,
      required bool isDay,
      required String condition,
      required String conditionIconPath,
      required double feelsLikeTemplCelcius,
      required int chanceOfRain,
      required int chanceOfSnow})
      : _time = time,
        _tempCelcius = tempCelcius,
        _isDay = isDay,
        _condition = condition,
        _conditionIconPath = conditionIconPath,
        _feelsLikeTemplCelcius = feelsLikeTemplCelcius,
        _chanceOfRain = chanceOfRain,
        _chanceOfSnow = chanceOfSnow;

  String get time => DateFormat('h:mm a').format(_time);

  String get tempCelcius => _tempCelcius.toStringAsFixed(1);
  String get feelsLikeTemplCelcius => _feelsLikeTemplCelcius.toStringAsFixed(1);

  String get chanceOfRain => '$_chanceOfRain %';

  String get chanceOfSnow => '$_chanceOfSnow %';

  bool get isDay => _isDay;
  String get condition => _condition;

  String get conditionIconPath {
    print(_conditionIconPath);
    return _conditionIconPath;
  }

  String get localAssetIconPath {
    var pathParts = _conditionIconPath.split('/');
    print('assets/images/${pathParts[pathParts.length - 2]}/${pathParts.last}');
    return 'assets/images/${pathParts[pathParts.length - 2]}/${pathParts.last}';
  }
}
