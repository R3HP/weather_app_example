// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'weather_degree_text.dart';
import 'weather_probabilty_indicator.dart';

class ForecastWeather extends StatelessWidget {
  const ForecastWeather({
    Key? key,
    required this.day,
    required this.svgPath,
    required this.rainProbablity,
    required this.weatherImagePath,
    required this.weatherLocalAssetImagePath,
    required this.degree,
  }) : super(key: key);
  final String day;
  final String svgPath;
  final String rainProbablity;
  final String weatherImagePath;
  final String weatherLocalAssetImagePath;
  final String degree;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(flex: 2, child: Text(day)),
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                WeatherProbablityIndicator(
                    weatherIconPath: svgPath,
                    probabiltyPercent: rainProbablity),
                FadeInImage.assetNetwork(
                  width: 64/2,
                  height: 64/2,
                          image: weatherImagePath,
                          placeholder: weatherLocalAssetImagePath,
                          imageErrorBuilder: (context, error, stackTrace) => Image.asset(weatherLocalAssetImagePath , width: 64/2,height: 64/2,),
                        ),
                WeatherDegreeText(degree: degree),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

