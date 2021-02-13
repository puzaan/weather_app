import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/weather_forecast/model/weather_forecast_model.dart';
import 'package:weather_app/weather_forecast/util/convert_icons.dart';
import 'package:weather_app/weather_forecast/util/forecast_util.dart';
Widget midView(AsyncSnapshot<WeatherForecastModel> snapshot){

  var city = snapshot.data.city.name;
  var country= snapshot.data.city.country;
  var forecastList = snapshot.data.list;
  //formatting date and * 1000 to get actual date
  var formatDate = new DateTime.fromMillisecondsSinceEpoch(forecastList[0].dt*1000);
  var forecast= forecastList[0];
  Container midView = Container(
    child: Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Text("${snapshot.data.city.name}, ${snapshot.data.city.country}")
          // or we can do
          Text("$city, $country", style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18
          ),),
          //Text("${Util.getFormattedDate(new DateTime.fromMillisecondsSinceEpoch(forcastList[0].dt))}")
          // or we can create method or variable  new DateTime.fromMillisecondsSinceEpoch to getFormattedDate
          // and call the method or vailable here
          Text("${Util.getFormattedDate(formatDate)}"),
          SizedBox(height: 10,),
          // Icon(Icons.wb_sunny, size: 195,),
          // Icon(FontAwesomeIcons.cloud,size: 198,color: Colors.blueGrey,),
          //we can get image depending on the weather description
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: getWeatherIcon(WeatherDescription: forecast.weather[0].main, color: Colors.grey, size: 180),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Text("${forecastList[0].temp.day.toStringAsFixed(0)}°F"),
                // or we can create variable and asinine forecastList[0] to forecast and calling it here
                Text("${forecast.temp.day.toStringAsFixed(0)}°F"),
                Text("${forecast.weather[0].description.toUpperCase()}"),
                

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    // or we can create variable and asinine forecastList[0] to forecast and calling it here
                    Text("${forecast.speed.toStringAsFixed(1)} mi/h"),
                    Icon(FontAwesomeIcons.temperatureHigh, size: 20,)
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      // or we can create variable and asinine forecastList[0] to forecast and calling it here
                      Text("${forecast.humidity.toStringAsFixed(0)} %"),
                      Icon(FontAwesomeIcons.solidGrinBeamSweat, size: 20),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.all(8.0)),
                Column(
                  children: [
                    // or we can create variable and asinine forecastList[0] to forecast and calling it here
                    //toStringAsFixed(1) is used to print 1 digit after decimal
                    Text("${forecast.temp.max.toStringAsFixed(1)} °F"),
                    Icon(FontAwesomeIcons.wind, size: 20)

                  ],
                )
              ],

            ),



          )
        ],

      ),

    ),

  );
  return midView;
}