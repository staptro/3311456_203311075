import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/MyContainer.dart';
import 'package:flutter_ui/buttons.dart';

class Pages extends StatefulWidget {
  const Pages({Key? key}) : super(key: key);

  @override
  State<Pages> createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                  },
                  icon: Icon(Icons.exit_to_app))
            ],
            backgroundColor: Colors.black,
            centerTitle: true,
            title: Text("Home")),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    child: insideContainer(
                      text: "Me",
                    ),
                    renk: Colors.amber,
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    child: insideContainer(
                      text: "Apps",
                    ),
                    renk: Colors.purple,
                  ),
                ),
              ],
            )),
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    child: insideContainer(
                      text: "Photo",
                    ),
                    renk: Colors.pinkAccent,
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    child: insideContainer(
                      text: "Weather",
                    ),
                    renk: Colors.indigoAccent,
                  ),
                ),
              ],
            )),
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    child: insideContainer(
                      text: "Food List",
                    ),
                    renk: Colors.lightGreenAccent[400],
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    child: insideContainer(
                      text: "Book List",
                    ),
                    renk: Colors.red,
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}

class insideContainer extends StatelessWidget {
  String? text;
  insideContainer({this.text});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: EdgeInsets.all(12),
          child: buttons(
            text: text,
          ),
        ),
      ],
    );
  }
}
