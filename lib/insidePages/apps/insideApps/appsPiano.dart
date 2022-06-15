import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class piano extends StatelessWidget {
  void playSound(int soundNumber) {
    final player = AudioCache();
    player.play('note$soundNumber.wav');
  }

  Expanded buttonSound({required ButtonStyle style, required int soundNumber}) {
    return Expanded(
      child: ElevatedButton(
        style: style,
        onPressed: () {
          // create a new player
          // Audio cache is for local assets
          playSound(soundNumber);
        },
        child: Text(
          '',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Piano"),
          backgroundColor: Colors.black,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buttonSound(
                style: ElevatedButton.styleFrom(
                    primary: Colors.red, enableFeedback: false),
                soundNumber: 1),
            buttonSound(
                style: ElevatedButton.styleFrom(
                    primary: Colors.green, enableFeedback: false),
                soundNumber: 2),
            buttonSound(
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue, enableFeedback: false),
                soundNumber: 3),
            buttonSound(
                style: ElevatedButton.styleFrom(
                    primary: Colors.yellow, enableFeedback: false),
                soundNumber: 4),
            buttonSound(
                style: ElevatedButton.styleFrom(
                    primary: Colors.purple, enableFeedback: false),
                soundNumber: 5),
            buttonSound(
                style: ElevatedButton.styleFrom(
                    primary: Colors.orange, enableFeedback: false),
                soundNumber: 6),
            buttonSound(
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue, enableFeedback: false),
                soundNumber: 7),
          ],
        ),
      ),
    );
  }
}
