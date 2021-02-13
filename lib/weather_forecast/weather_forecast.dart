import 'package:flutter/material.dart';
import 'package:weather_app/weather_forecast/model/weather_forecast_model.dart';
import 'package:weather_app/weather_forecast/network/network.dart';
import 'package:weather_app/weather_forecast/ui/bottom_view.dart';
import 'package:weather_app/weather_forecast/ui/mid_view.dart';

class Forecast extends StatefulWidget {
  @override
  _ForecastState createState() => _ForecastState();
}

class _ForecastState extends State<Forecast> {
  Future<WeatherForecastModel> forecastObject;
  String _citName = " kathmandu";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // forecastObject = Network().getWeatherForecast(cityName: _citName);
    // or
    //calling method
    forecastObject = getWeather(cityName: _citName);


    // forecastObject.then((weather) {
    //   print(weather.list[0].weather[0].main);
    // });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            textFieldVew(),
            Container(
              child: FutureBuilder<WeatherForecastModel>
                (future: forecastObject,
                  builder: (BuildContext context, AsyncSnapshot<WeatherForecastModel> snapshot){
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        //importing midView.dart file
                        midView(snapshot),
                        //importing bottomView.dart file
                        bottomView(snapshot, context),
                      ],
                    );
                  }  else{
                    return Container(
                      child: Center(child: CircularProgressIndicator(),),
                    );
                  }
                  }),

            )
          ],
        ),
      ),

    );
  }

  Widget textFieldVew() {
    return Container(
      child: TextField(
        decoration: InputDecoration(
          hintText: "Enter City Name",
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
            contentPadding: EdgeInsets.all(8),

        ),
        onSubmitted: (value){
          setState(() {
            _citName = value;
            // forecastObject = new Network().getWeatherForecast(cityName: _citName);
          //  or we can create method and call the method

            forecastObject = getWeather(cityName: _citName);
          });

        },
      ),
    );
  }
  Future<WeatherForecastModel> getWeather({String cityName})=>
      new Network().getWeatherForecast(cityName: _citName);
}


