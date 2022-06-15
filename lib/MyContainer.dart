import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  final Color? renk;
  Widget? child;
  AssetImage? photo;
  MyContainer({this.renk = Colors.white, this.child, this.photo});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12.0),
      decoration:
          BoxDecoration(color: renk, borderRadius: BorderRadius.circular(12.0)),
      child: child,
    );
  }
}
