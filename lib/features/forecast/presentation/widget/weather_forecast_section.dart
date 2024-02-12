import 'package:flutter/material.dart';

import '../view_model/forecast_weather_view_model.dart';
import 'weather_forcasting.dart';

class WeatherForecastSection extends StatelessWidget {
  const WeatherForecastSection({
    Key? key,
    this.forecastWeatherList,
  }) : super(key: key);

  final List<ForecastWeatherViewModel>? forecastWeatherList;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: 25, vertical: 8.0 * 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              offset: Offset(2, -2),
              color: Color.fromARGB(255, 56, 28, 103),
            )
          ],
          gradient: const LinearGradient(colors: [
            Color.fromARGB(255, 42, 22, 76),
            Color.fromARGB(255, 91, 68, 132)
          ])),
      width: double.infinity,
      height: size.height * 0.3,
      padding: const EdgeInsets.all(16.0),
      child: forecastWeatherList != null 
          ? ListView.builder(
              itemCount: forecastWeatherList!.length,
              itemBuilder: (ctx, index) {
                final forecastDayWeather =
                    forecastWeatherList![index];
                return ForecastWeather(
                    day: forecastDayWeather.weekDay,
                    svgPath: 'assets/images/rain-drop.svg',
                    rainProbablity:
                        forecastDayWeather.chanceOfRain,
                    weatherImagePath:
                        forecastDayWeather.conditionIconPath,
                    weatherLocalAssetImagePath:
                        forecastDayWeather.localAssetIconPath,
                    degree:
                        forecastDayWeather.avgTempCelcius);
              },
              shrinkWrap: true,
            )
          : const SizedBox(),
    );
  }
}
