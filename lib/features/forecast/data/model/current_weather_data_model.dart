// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CurrentWeatherDataModel {
  final double tempCelcius;
  final bool isDay;
  final String condition;
  final String conditionIconPath;
  final double feelsLikeTemplCelcius;
  final String city;
  final String region;
  final String country;

  CurrentWeatherDataModel({
    required this.tempCelcius,
    required this.isDay,
    required this.condition,
    required this.conditionIconPath,
    required this.city,
    required this.region,
    required this.country,
    required this.feelsLikeTemplCelcius,
  });

  CurrentWeatherDataModel copyWith({
    double? tempCelcius,
    bool? isDay,
    String? condition,
    String? conditionIconPath,
    String? city,
    String? region,
    String? country,
    double? feelsLikeTemplCelcius,
  }) {
    return CurrentWeatherDataModel(
      tempCelcius: tempCelcius ?? this.tempCelcius,
      isDay: isDay ?? this.isDay,
      city: city ?? this.city,
      region: region ?? this.region,
      country: country ?? this.country,
      condition: condition ?? this.condition,
      conditionIconPath: conditionIconPath ?? this.conditionIconPath,
      feelsLikeTemplCelcius:
          feelsLikeTemplCelcius ?? this.feelsLikeTemplCelcius,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'location': {'name': city, 'region': region, 'country': country},
      'current': {
        'temp_c': tempCelcius,
        'is_day': isDay,
        'condition': {'text': condition, 'icon': conditionIconPath},
        'feelslike_c': feelsLikeTemplCelcius,
      }
    };
  }

  factory CurrentWeatherDataModel.fromMap(Map<String, dynamic> map) {
    return CurrentWeatherDataModel(
      city: map['location']['name'],
      region: map['location']['region'],
      country: map['location']['country'],
      tempCelcius: map['current']['temp_c'] as double,
      isDay: map['current']['is_day'] as int == 0 ? false : true,
      condition: map['current']['condition']['text'] as String,
      conditionIconPath: 'http://${(map['current']['condition']['icon'] as String).substring(2)}',
      feelsLikeTemplCelcius: map['current']['feelslike_c'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory CurrentWeatherDataModel.fromJson(String source) =>
      CurrentWeatherDataModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CurrentWeatherDataModel(city: $city,region: $region,country: $country ,tempCelcius: $tempCelcius, isDay: $isDay, condition: $condition, conditionIconPath: $conditionIconPath, feelsLikeTemplCelcius: $feelsLikeTemplCelcius)';
  }

  @override
  bool operator ==(covariant CurrentWeatherDataModel other) {
    if (identical(this, other)) return true;

    return other.tempCelcius == tempCelcius &&
        other.isDay == isDay &&
        other.condition == condition &&
        other.conditionIconPath == conditionIconPath &&
        other.city == city &&
        other.region == region &&
        other.country == country &&
        
        other.feelsLikeTemplCelcius == feelsLikeTemplCelcius;
  }

  @override
  int get hashCode {
    return tempCelcius.hashCode ^
        isDay.hashCode ^
        condition.hashCode ^
        conditionIconPath.hashCode ^
        city.hashCode ^
        region.hashCode ^
        country.hashCode ^
        feelsLikeTemplCelcius.hashCode;
  }
}
