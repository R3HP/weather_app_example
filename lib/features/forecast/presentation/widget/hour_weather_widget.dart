import 'package:flutter/material.dart';

import '../view_model/hour_weather_view_model.dart';
import 'weather_degree_text.dart';
import 'weather_probabilty_indicator.dart';

class HourWeatherWidget extends StatelessWidget {
  const HourWeatherWidget({super.key, required this.hourWeatherViewModel});

  final HourWeatherViewModel hourWeatherViewModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 1),
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(hourWeatherViewModel.time),
          // Expanded(
          //     child: Image.network(hourWeatherViewModel.conditionIconPath)),
          // Expanded(
          //     child: Image.asset(hourWeatherViewModel.localAssetIconPath)),
          Expanded(
              child: Transform.scale(
                scale: 1,
                child: FadeInImage.assetNetwork(
                          image: hourWeatherViewModel.conditionIconPath,
                          placeholder: hourWeatherViewModel.localAssetIconPath,
                          imageErrorBuilder: (context, error, stackTrace) => Image.asset(hourWeatherViewModel.localAssetIconPath),
                        ),
              )),
          WeatherDegreeText(degree: hourWeatherViewModel.tempCelcius),
          WeatherProbablityIndicator(
            weatherIconPath: 'assets/images/rain-drop.svg',
            probabiltyPercent: hourWeatherViewModel.chanceOfRain,
          )
        ],
      ),
    );
  }
}
