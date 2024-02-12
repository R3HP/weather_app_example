// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class HourWeatherDataModel {
  final DateTime time;
  final double tempCelcius;
  final bool isDay;
  final String condition;
  final String conditionIconPath;
  final double feelsLikeTemplCelcius;
  final int chanceOfRain;
  final int chanceOfSnow;

  HourWeatherDataModel({
    required this.time,
    required this.tempCelcius,
    required this.isDay,
    required this.condition,
    required this.conditionIconPath,
    required this.feelsLikeTemplCelcius,
    required this.chanceOfRain,
    required this.chanceOfSnow,
  });

  HourWeatherDataModel copyWith({
    DateTime? time,
    double? tempCelcius,
    bool? isDay,
    String? condition,
    String? conditionIconPath,
    double? feelsLikeTemplCelcius,
    int? chanceOfRain,
    int? chanceOfSnow,
  }) {
    return HourWeatherDataModel(
      time: time ?? this.time,
      tempCelcius: tempCelcius ?? this.tempCelcius,
      isDay: isDay ?? this.isDay,
      condition: condition ?? this.condition,
      conditionIconPath: conditionIconPath ?? this.conditionIconPath,
      feelsLikeTemplCelcius:
          feelsLikeTemplCelcius ?? this.feelsLikeTemplCelcius,
      chanceOfRain: chanceOfRain ?? this.chanceOfRain,
      chanceOfSnow: chanceOfSnow ?? this.chanceOfSnow,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'temp_c': tempCelcius,
      'is_day': isDay,
      'condition': {'text': condition, 'icon': conditionIconPath},
      'feelslike_c': feelsLikeTemplCelcius,
      'chance_of_rain': chanceOfRain,
      'chance_of_snow': chanceOfSnow,
      'time': time.toString()
    };
  }

  factory HourWeatherDataModel.fromMap(Map<String, dynamic> map) {
    return HourWeatherDataModel(
      time: DateTime.parse(map['time'] as String? ?? '00:00'),
      tempCelcius: map['temp_c'] as double? ?? 0,
      isDay: (map['is_day'] as int) == 0 ? false : true,
      condition: map['condition']['text'] as String,
      conditionIconPath: ('http://${(map['condition']['icon'] as String).substring(2)}'),
      feelsLikeTemplCelcius: map['feelslike_c'] as double,
      chanceOfRain: map['chance_of_rain'] as int,
      chanceOfSnow: map['chance_of_snow'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory HourWeatherDataModel.fromJson(String source) =>
      HourWeatherDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'HourWeatherDataModel(time: $time, tempCelcius: $tempCelcius, isDay: $isDay, condition: $condition, conditionIconPath: $conditionIconPath, feelsLikeTemplCelcius: $feelsLikeTemplCelcius, chanceOfRain: $chanceOfRain, chanceOfSnow: $chanceOfSnow)';
  }

  @override
  bool operator ==(covariant HourWeatherDataModel other) {
    if (identical(this, other)) return true;

    return other.time == time &&
        other.tempCelcius == tempCelcius &&
        other.isDay == isDay &&
        other.condition == condition &&
        other.conditionIconPath == conditionIconPath &&
        other.feelsLikeTemplCelcius == feelsLikeTemplCelcius &&
        other.chanceOfRain == chanceOfRain &&
        other.chanceOfSnow == chanceOfSnow;
  }

  @override
  int get hashCode {
    return time.hashCode ^
        tempCelcius.hashCode ^
        isDay.hashCode ^
        condition.hashCode ^
        conditionIconPath.hashCode ^
        feelsLikeTemplCelcius.hashCode ^
        chanceOfRain.hashCode ^
        chanceOfSnow.hashCode;
  }
}
