import 'package:flutter/material.dart';

import '../view_model/hour_weather_view_model.dart';
import 'hour_weather_widget.dart';


class TodayWeatherHoursSection extends StatelessWidget {
  const TodayWeatherHoursSection({
    Key? key,
    this.todayHoursWeather,
  }) : super(key: key);

  final List<HourWeatherViewModel>? todayHoursWeather;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 56.0),
      height: 110,
      child: todayHoursWeather != null 
          ? ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount:
                  todayHoursWeather!.length,
              itemBuilder: (context, index) =>
                  HourWeatherWidget(
                      hourWeatherViewModel: todayHoursWeather![index]),
            )
          : const Center(
              child: CircularProgressIndicator(
                color: Colors.grey,
              ),
            ),
    );
  }
}
