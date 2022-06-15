import 'package:flutter/material.dart';
import 'package:flutter_ui/insidePages/apps/insideApps/appsBmi.dart';
import 'package:flutter_ui/insidePages/apps/insideApps/appsPiano.dart';
import 'package:flutter_ui/insidePages/apps/insideApps/firestoreApp.dart';
import 'package:flutter_ui/insidePages/apps/insideApps/gesturesTest.dart';

class AppsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text("Apps"),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 12,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Container(
                  margin: EdgeInsets.all(12),
                  height: 140,
                  width: 140,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => piano()),
                          );
                        },
                        child: Text(
                          "Piano",
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(12),
                  height: 140,
                  width: 140,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Bmi()),
                          );
                        },
                        child: Text(
                          "BMI ",
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Container(
                  margin: EdgeInsets.all(12),
                  height: 140,
                  width: 140,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FirestoreApp()),
                          );
                        },
                        child: Text(
                          "Firestore App",
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(12),
                  height: 140,
                  width: 140,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => gestureTest()),
                          );
                        },
                        child: Text(
                          "Gesture Test",
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
