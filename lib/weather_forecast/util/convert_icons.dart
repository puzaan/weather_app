import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: missing_return
Widget getWeatherIcon({String WeatherDescription, Color color, double size}) {
  switch (WeatherDescription) {
    case "Clear":
      {
        return Icon(FontAwesomeIcons.sun, color: Colors.yellow, size: size,);
      }
      break;

    case "Clouds":
      {
        return Icon(FontAwesomeIcons.cloud, color: Colors.black38, size: size,);
      }
      break;
    case "Snow":
      {
        return Icon(FontAwesomeIcons.snowplow, color: Colors.white, size: size,);
      }
      break;

    case "Rain":
      {
        return Icon(FontAwesomeIcons.cloudRain, color: color, size: size,);
      }
      break;

    default:
      {
        return Icon(FontAwesomeIcons.sun, color: color, size: size,);
      }
      break;
  }
}