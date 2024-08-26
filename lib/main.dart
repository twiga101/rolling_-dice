import 'package:flutter/material.dart';
import 'package:rolling_dice/screens/rolling-dice/rolling_dice_home.dart';


void main() {
  runApp(DiceApp());
}

class DiceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RollingDice(),
    );
  }
}

