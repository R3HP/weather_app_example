import 'package:flutter/material.dart';

import '../view_model/current_weather_view_model.dart';
import 'weather_degree_text.dart';

class CurrentWeatherSection extends StatelessWidget {
  const CurrentWeatherSection({
    Key? key,
    this.currentWeatherViewModel,
    this.date,
    this.dayMaxTemp,
    this.dayMinTemp,
  }) : super(key: key);

  final CurrentWeatherViewModel? currentWeatherViewModel;
  final String? date;
  final String? dayMaxTemp;
  final String? dayMinTemp;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.25,
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(255, 42, 22, 76),
        Color.fromARGB(255, 91, 68, 132)
      ])),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(date ??
                    'Loading'),
                Text(currentWeatherViewModel?.regionCountry ??
                    'Loading...-Loading'),
                const SizedBox(
                  height: 20,
                ),
                WeatherDegreeText(
                    degree:
                        currentWeatherViewModel?.tempCelcius ?? '0',
                    textSize: 34),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment:
                          CrossAxisAlignment.center,
                      children: [
                        const Icon(
                            Icons.keyboard_arrow_down_sharp),
                        WeatherDegreeText(
                            degree: dayMinTemp ??
                                '0')
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment:
                          CrossAxisAlignment.center,
                      children: [
                        const Icon(
                            Icons.keyboard_arrow_up_sharp),
                        WeatherDegreeText(
                            degree: dayMaxTemp ??
                                '0')
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  currentWeatherViewModel?.condition ?? 'Loading...',
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment:
                      CrossAxisAlignment.center,
                  children: [
                    const Text('Feeling Like '),
                    WeatherDegreeText(
                        degree: currentWeatherViewModel?.feelsLikeTemplCelcius ??
                            '0')
                  ],
                )
              ],
            ),
          ),
          Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: currentWeatherViewModel != null
                      ? FadeInImage.assetNetwork(
                        image: currentWeatherViewModel!.conditionIconPath,
                        placeholder: currentWeatherViewModel!.localAssetIconPath,
                        imageErrorBuilder: (context,
                                error, stackTrace) =>
                            Image.asset(currentWeatherViewModel!.localAssetIconPath),
                      )
                      : Image.asset(
                          'assets/images/day/113.png')))
        ],
      ),
    );
  }
}