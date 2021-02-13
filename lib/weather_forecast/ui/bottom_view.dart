
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/weather_forecast/model/weather_forecast_model.dart';

import 'forecast_card.dart';

Widget bottomView(AsyncSnapshot <WeatherForecastModel> snapshot , BuildContext){
  //snapshot.data.list; called from api 
  // by creating var forecastList we can use this throughout the class 
  var forecastList = snapshot.data.list;

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text(("7-Day s Weather Forecast".toUpperCase()),style: TextStyle(
        fontSize: 15,
        color: Colors.black,
      ),),
      Container(
        height: 180,
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index)=> SizedBox(width: 8,),
            itemCount: forecastList.length,
          itemBuilder: (context, index)=> ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Container(
              width: MediaQuery.of(context).size.width/2.3,
              height: 190,
                //import forecast_card.dirt file
                child: forecastCard(snapshot, index),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors:[Color(0xff9661C3), Colors.white],
                begin: Alignment.topLeft, end: Alignment.bottomRight)
              ),
            ),
          )

        ),
      )
    ],
    
  );
}