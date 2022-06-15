import 'package:flutter/material.dart';
import 'package:flutter_ui/MyContainer.dart';

class Bmi extends StatefulWidget {
  @override
  State<Bmi> createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  double _height = 185;
  double weight = 80;
  double? _results;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: () {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text("Values"),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Less then 18.5 = Underweight",
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            "18.5-24.9 = Normal",
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            "25-29.9 = Overweight",
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            "More than 31 = Obese",
                            textAlign: TextAlign.left,
                          )
                        ],
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'OK'),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                },
                child: Icon(
                  Icons.info,
                  size: 26,
                ),
              ),
            )
          ],
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text("Body Mass Index"),
        ),
        body: Column(
          children: [
            Expanded(
              child: MyContainer(
                child: Container(
                  margin: EdgeInsets.all(12),
                  height: double.infinity,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Text(
                        "Your Height (cm)",
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        _height.round().toString(),
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                      Slider(
                        min: 50,
                        max: 280,
                        value: _height,
                        onChanged: (double newValue) {
                          setState(() {
                            _height = newValue;
                          });
                        },
                      )
                    ],
                  ),
                ),
                renk: Colors.lime,
              ),
            ),
            Expanded(
              child: MyContainer(
                child: Container(
                  margin: EdgeInsets.all(12),
                  height: double.infinity,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Text(
                        "Your Weight (kg)",
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        weight.round().toString(),
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                      Slider(
                        min: 10,
                        max: 330,
                        value: weight,
                        onChanged: (double newValue2) {
                          setState(() {
                            weight = newValue2;
                          });
                        },
                      )
                    ],
                  ),
                ),
                renk: Colors.lime,
              ),
            ),
            Expanded(
              child: MyContainer(
                child: Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.all(12),
                  height: double.infinity,
                  width: double.infinity,
                  child: Column(
                    children: [
                      TextButton(
                        child: Text(
                          "Compute BMI",
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                        onPressed: CalculateBMI,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Text(
                          _results == null
                              ? "Press Compute BMI button."
                              : "Your BMI is: ${_results!.toStringAsFixed(2)}",
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                      )
                      //Text(results.round().toString())
                    ],
                  ),
                ),
                renk: Colors.lime,
              ),
            )
          ],
        ),
      ),
    );
  }

  void CalculateBMI() {
    double height = _height / 100;
    double heightSquare = height * height;
    double results = weight / heightSquare;
    _results = results;
    setState(() {});
  }
}
