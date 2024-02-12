import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WeatherProbablityIndicator extends StatelessWidget {
  const WeatherProbablityIndicator({
    Key? key,
    required this.weatherIconPath,
    required this.probabiltyPercent,
  }) : super(key: key);

  final String weatherIconPath;
  final String probabiltyPercent;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          weatherIconPath,
          height: 15,
          width: 15,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(probabiltyPercent),
      ],
    );
  }
}

