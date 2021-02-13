import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/weather_forecast/model/weather_forecast_model.dart';
import 'package:weather_app/weather_forecast/util/convert_icons.dart';
import 'package:weather_app/weather_forecast/util/forecast_util.dart';

Widget forecastCard(AsyncSnapshot<WeatherForecastModel>snapshot, int index){
  var forecastList = snapshot.data.list;

  var dayOfWeek= " ";
  DateTime date = new DateTime.fromMillisecondsSinceEpoch(forecastList[index].dt * 1000) ;
  // or ve can do
  //var fullDate; Util.getFormattedDate(new DateTime.fromMillisecondsSinceEpoch(forecastList[index].dt * 1000));
  var fullDate= Util.getFormattedDate(date);
  // splitting full date into list  and calling first index
  dayOfWeek= fullDate.split(',')[0];  //[today day, month &day, year]

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,

    children: [
      Center(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(dayOfWeek, style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold
        ),),
      )),
      Row(
        children: [
          CircleAvatar(
            radius: 33,
              backgroundColor: Colors.white,
            // for adding icon of weather from weather description to forecast list of to index to weather of  index to main
            child: getWeatherIcon(WeatherDescription:forecastList[index].weather[0].main,)
          ),
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(("${forecastList[index].temp.day.toStringAsFixed(0)} °F"), ),

                  ),
                  Icon(FontAwesomeIcons.solidArrowAltCircleDown, color: Colors.white, ),

                ],
              ),
              Row(
                children: [
                  Text(("${forecastList[index].temp.max.toStringAsFixed(0)} °F"), ),
                  Icon(FontAwesomeIcons.solidArrowAltCircleUp, color: Colors.white, ),
                ],
              ),
              Row(
                children: [
                  Text(("${forecastList[index].humidity.toStringAsFixed(0)} %"), ),
                  Icon(FontAwesomeIcons.solidGrinBeamSweat, color: Colors.white, ),

                ],
              ),
              Row(
                children: [
                  Text(("${forecastList[index].speed.toStringAsFixed(1)} mi/hr"), ),
                   Icon(FontAwesomeIcons.wind, color: Colors.white, ),

                ],
              )
            ],
          )
          
        ],
      )

    ],
  );


}