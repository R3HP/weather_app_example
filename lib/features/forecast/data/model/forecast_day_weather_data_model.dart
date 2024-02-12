// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:weather_app_example/features/forecast/data/model/hour_weather_data_model.dart';

class ForecastDayWeatherDataModel {
  final DateTime date;
  final double maxTempCelcius;
  final double minTempCelcius;
  final double avgTempCelcius;
  final int chanceOfRain;
  final int chanceOfSnow;
  final String condition;
  
  final String conditionIconPath;
  final List<HourWeatherDataModel> hoursWeatherData;

  ForecastDayWeatherDataModel(
      {required this.date,
      required this.maxTempCelcius,
      required this.minTempCelcius,
      required this.avgTempCelcius,
      required this.chanceOfRain,
      required this.chanceOfSnow,
      required this.condition,
      required this.conditionIconPath,
      required this.hoursWeatherData});

  ForecastDayWeatherDataModel copyWith({
    DateTime? date,
    double? maxTempCelcius,
    double? minTempCelcius,
    double? avgTempCelcius,
    int? chanceOfRain,
    int? chanceOfSnow,
    String? condition,
    
    String? conditionIconPath,
    List<HourWeatherDataModel>? hoursWeatherData,
  }) {
    return ForecastDayWeatherDataModel(
        date: date ?? this.date,
        maxTempCelcius: maxTempCelcius ?? this.maxTempCelcius,
        minTempCelcius: minTempCelcius ?? this.minTempCelcius,
        avgTempCelcius: avgTempCelcius ?? this.avgTempCelcius,
        chanceOfRain: chanceOfRain ?? this.chanceOfRain,
        chanceOfSnow: chanceOfSnow ?? this.chanceOfSnow,
        condition: condition ?? this.condition,
        conditionIconPath: conditionIconPath ?? this.conditionIconPath,
        
        hoursWeatherData: hoursWeatherData ?? this.hoursWeatherData);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date.toString(),
      
      'day': {
        'maxtemp_c': maxTempCelcius,
        'mintemp_c': minTempCelcius,
        'avgtemp_c': avgTempCelcius,
        'daily_chance_of_rain': chanceOfRain,
        'daily_chance_of_snow': chanceOfSnow,
        'condition': {'text': condition, 'icon': conditionIconPath},
      },
      'hour': hoursWeatherData.map((e) => e.toMap()).toList()
    };
  }

  factory ForecastDayWeatherDataModel.fromMap(Map<String, dynamic> map) {
    return ForecastDayWeatherDataModel(
        date: DateTime.parse(map['date'] as String),
        
        maxTempCelcius: map['day']['maxtemp_c'] as double,
        minTempCelcius: map['day']['mintemp_c'] as double,
        avgTempCelcius: map['day']['avgtemp_c'] as double,
        chanceOfRain: map['day']['daily_chance_of_rain'] as int,
        chanceOfSnow: map['day']['daily_chance_of_snow'] as int,
        condition: map['day']['condition']['text'] as String,
        conditionIconPath: 'http://${(map['day']['condition']['icon'] as String).substring(2)}',
        hoursWeatherData: (map['hour'] as List<dynamic>)
            .map((e) => HourWeatherDataModel.fromMap(e))
            .toList());
  }

  String toJson() => json.encode(toMap());

  factory ForecastDayWeatherDataModel.fromJson(String source) =>
      ForecastDayWeatherDataModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ForecastDayWeatherDataModel(date: $date,maxTempCelcius: $maxTempCelcius, minTempCelcius: $minTempCelcius, avgTempCelcius: $avgTempCelcius, chanceOfRain: $chanceOfRain, chanceOfSnow: $chanceOfSnow, condition: $condition, conditionIconPath: $conditionIconPath)';
  }

  @override
  bool operator ==(covariant ForecastDayWeatherDataModel other) {
    if (identical(this, other)) return true;

    return other.date == date &&
        other.maxTempCelcius == maxTempCelcius &&
        other.minTempCelcius == minTempCelcius &&
        other.avgTempCelcius == avgTempCelcius &&
        other.chanceOfRain == chanceOfRain &&
        other.chanceOfSnow == chanceOfSnow &&
        other.condition == condition &&
        
        other.conditionIconPath == conditionIconPath;
  }

  @override
  int get hashCode {
    return date.hashCode ^
        maxTempCelcius.hashCode ^
        minTempCelcius.hashCode ^
        avgTempCelcius.hashCode ^
        chanceOfRain.hashCode ^
        chanceOfSnow.hashCode ^
        condition.hashCode ^
        
        conditionIconPath.hashCode;
  }
}
