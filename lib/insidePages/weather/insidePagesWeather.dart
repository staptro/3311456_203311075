import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_ui/insidePages/weather/weatherSelectCity.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherPage extends StatefulWidget {
  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  double? temperature;
  var locationData;
  var cityName = "Ankara";
  int? temperatureInt;
  var weather;

  Future<void> getCityName() async {
    locationData = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=429a7896762c0f7a6b46acdea67c5ecf'));
    var locationDataParsed = jsonDecode(locationData.body);
    cityName = locationDataParsed['name'];
  }

  Future<void> getLocationTemperature() async {
    var locationTemp = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&units=metric&appid=429a7896762c0f7a6b46acdea67c5ecf'));
    var tempDataParsed = jsonDecode(locationTemp.body);
    setState(() {
      temperature = tempDataParsed['main']['temp'];
    });
    temperatureInt = temperature!.round();
  }

  Future<void> getLocationWeather() async {
    var locationWeather = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$cityName&units=metric&appid=429a7896762c0f7a6b46acdea67c5ecf"));
    var weatherDataParsed = jsonDecode(locationWeather.body);
    setState(() {
      weather = weatherDataParsed["weather"][0]["main"];
    });
  }

  @override
  void initState() {
    getDataFromAPI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text("Weather"),
        ),
        body: temperature == null
            ? Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              )
            : Column(
                children: [
                  Container(
                    height: 250,
                    width: 450,
                    color: Colors.blue,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Text(
                            "Weather in $cityName",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: ListView(
                        children: [
                          ListTile(
                            leading: FaIcon(FontAwesomeIcons.temperatureHalf),
                            title: Text("Temperature"),
                            trailing: Text("$temperatureInt"),
                          ),
                          ListTile(
                            leading: FaIcon(FontAwesomeIcons.cloudSun),
                            title: Text("Weather"),
                            trailing: Text("$weather"),
                          ),
                        ],
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      cityName = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => weather_selectCity()),
                      );
                      getDataFromAPI();
                      setState(() {
                        cityName = cityName;
                      });
                    },
                    child: Text("Change City"),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
      ),
    );
  }

  Future<void> getDataFromAPI() async {
    await getCityName();
    getLocationTemperature();
    getLocationWeather();
  }
}
