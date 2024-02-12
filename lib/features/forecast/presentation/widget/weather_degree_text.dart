import 'package:flutter/material.dart';

class WeatherDegreeText extends StatelessWidget {
  const WeatherDegreeText({
    Key? key,
    this.textSize,
    required this.degree,
  }) : super(key: key);
  final double? textSize;
  final String degree;

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: degree,
          style: const TextStyle(color: Colors.white)),
      const TextSpan(text: ' '),
      TextSpan(text: '.C', style: TextStyle(color: Colors.amber.shade700))
    ], style: TextStyle(fontSize: textSize)));
  }
}
