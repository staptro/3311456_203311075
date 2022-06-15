import 'package:flutter/material.dart';
import 'insidePages/books/insidePagebBookList.dart';
import 'insidePages/me/insidePagesMe.dart';
import 'insidePages/weather/insidePagesWeather.dart';
import 'insidePages/photos/insidePagesPhoto.dart';
import 'insidePages/foodList/insidePagesFoodList.dart';
import 'insidePages/apps/insidePagesApps.dart';

class buttons extends StatelessWidget {
  String? text;
  buttons({this.text});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (text == "Me") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MePage()),
          );
        } else if (text == "Book List") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BooksPage()),
          );
        } else if (text == "Photo") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PhotoPage()),
          );
        } else if (text == "Weather") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => WeatherPage()),
          );
        } else if (text == "Food List") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NotesPage()),
          );
        } else if (text == "Apps") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AppsPage()),
          );
        }
      },
      child: Text(
        "${text.toString()}",
        style: TextStyle(fontSize: 30, color: Colors.white),
      ),
    );
  }
}
