import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class weather_selectCity extends StatefulWidget {
  const weather_selectCity({Key? key}) : super(key: key);

  @override
  State<weather_selectCity> createState() => _weather_selectCityState();
}

class _weather_selectCityState extends State<weather_selectCity> {
  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Select City"),
          centerTitle: true,
        ),
        body: Container(
          child: Column(
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
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: TextField(
                        controller: myController,
                        style: TextStyle(fontSize: 30),
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          labelText: "Enter City Name",
                          labelStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextButton(
                      onPressed: () async {
                        var response = await http.get(Uri.parse(
                            'https://api.openweathermap.org/data/2.5/weather?q=${myController.text}&appid=429a7896762c0f7a6b46acdea67c5ecf'));
                        var checkCity = jsonDecode(response.body)['cod'];
                        var checkCityMessage =
                            jsonDecode(response.body)['message'];
                        if (checkCity == "404") {
                          var checkCityMessage =
                              jsonDecode(response.body)['message'];
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: Text("Alert!!"),
                              content: Text('$checkCityMessage'),
                              actions: <Widget>[
                                TextButton(
                                  child: Text("OK"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            ),
                          );
                        } else
                          Navigator.pop(context, myController.text);
                      },
                      child: Text(
                        "Save",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
