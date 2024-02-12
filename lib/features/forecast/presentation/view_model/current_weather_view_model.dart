class CurrentWeatherViewModel {
  final double _tempCelcius;
  final bool _isDay;
  final String _condition;
  final String _conditionIconPath;
  final double _feelsLikeTemplCelcius;
  final String _city;
  final String _region;
  final String _country;

  CurrentWeatherViewModel(
      {required double tempCelcius,
      required bool isDay,
      required String condition,
      required String conditionIconPath,
      required String city,
      required String region,
      required String country,
      required double feelsLikeTemplCelcius})
      : _tempCelcius = tempCelcius,
        _isDay = isDay,
        _condition = condition,
        _city = city,
        _region = region,
        _country = country,
        _conditionIconPath = conditionIconPath,
        _feelsLikeTemplCelcius = feelsLikeTemplCelcius;

  String get tempCelcius => _tempCelcius.toStringAsFixed(1);

  String get feelsLikeTemplCelcius => _feelsLikeTemplCelcius.toStringAsFixed(1);

  bool get isDay => _isDay;

  String get condition => _condition;

  String get conditionIconPath => _conditionIconPath;

  String get localAssetIconPath {
    var pathParts = _conditionIconPath.split('/');
    return 'assets/images/${pathParts[pathParts.length - 2]}/${pathParts.last}';
  }

  String get location => '$_city - $_region - $_country';

  String get regionCountry => '$_region - $_country';

  String get region => _region;

  String get city => _city;

  String get country => _country;
}
