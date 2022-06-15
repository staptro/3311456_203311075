import 'package:flutter/material.dart';

class MePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text("Me"),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 10,
                ),
                CircleAvatar(
                  radius: 80.0,
                  backgroundColor: Colors.yellow,
                  backgroundImage: AssetImage('assets/pcmr.jpg'),
                ),
                SizedBox(
                  height: 15,
                ),
                containerCards(
                  color: Colors.amber,
                  icon: Icons.person,
                  text: "Serhat Halıpınar",
                ),
                SizedBox(
                  height: 15,
                ),
                containerCards(
                  color: Colors.amber,
                  icon: Icons.mail,
                  text: "serhat.thalion@gmail.com",
                ),
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.amber, width: 5),
                  ),
                  margin: EdgeInsets.all(12),
                  child: Text(
                    "I am studying at Selcuk University, i'm new to flutter, actually i'm new about all coding stuff. Computer is very complicated, everyone says i must find shorter algorithm but in the computer terms shorter way means very very long way. When i was coding i am thinking one question how can you do that mistake, you are so useless. i wonder is everyone feels stupid when is coding ? Junior or senior doesn't matter are you ask yourself this question ? if so i can relieve. Because you are make something beautiful even you are think stupid and that is incredible. I ask myself when i see a big programs thinking about wow how do they do it! You did this programs, i hope i can make this too. Anyway i work harder then everyday and i see how big the computer science is, its get bigger everyday. First time i was learning coding and i thought ok i learn all about computer. But now i say don't know anything about coding. I love computers and i believe i can make succesfull about it. ",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class containerCards extends StatelessWidget {
  Color? color;
  IconData? icon;
  String text;
  Widget? child;
  containerCards({this.color, this.icon, required this.text, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 45.0),
      padding: EdgeInsets.all(12),
      color: color,
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          SizedBox(
            width: 10.0,
          ),
          Text(
            text,
            style: TextStyle(fontSize: 18, color: Colors.white),
          )
        ],
      ),
    );
  }
}
