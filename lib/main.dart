import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Xylophone(),
    ),
  );
}

class Xylophone extends StatelessWidget {
  const Xylophone({Key? key}) : super(key: key);

//function to play sounds from the xylophone
  void playSound({required int soundNumber}) async {
    final player = AudioPlayer();
    player.play(
      AssetSource('note$soundNumber.wav'),
    );

    await player.dispose();
  }

//resusable widget for eachkey of the xylophone
  Widget eachKey({
    required Color primary,
    required int soundNumber,
  }) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: primary),
        onPressed: () {
          playSound(soundNumber: soundNumber);
        },
        child: null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            eachKey(primary: Colors.red, soundNumber: 1),
            eachKey(primary: Colors.blue, soundNumber: 2),
            eachKey(primary: Colors.green, soundNumber: 3),
            eachKey(primary: Colors.yellow, soundNumber: 4),
            eachKey(primary: Colors.orange, soundNumber: 5),
            eachKey(primary: Colors.teal, soundNumber: 6),
            eachKey(primary: Colors.purple, soundNumber: 7),
          ],
        ),
      ),
    );
  }
}
