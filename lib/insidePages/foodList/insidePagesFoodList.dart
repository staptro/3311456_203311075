import 'package:flutter/material.dart';
import 'package:flutter_ui/insidePages/dinners/notesDinners.dart';

class NotesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text("Food List"),
        ),
        body: dinnerList(),
      ),
    );
  }
}
