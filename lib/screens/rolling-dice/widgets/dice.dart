import 'package:flutter/material.dart';
import 'package:rolling_dice/screens/rolling-dice/widgets/dice_design.dart';

class Dice extends StatelessWidget {
  const Dice({
    super.key,
    required this.dice_number,
  });

  final int dice_number;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 105,
      height: 105,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 10, 161, 188),
            Color.fromARGB(255, 53, 229, 216),
            Color.fromARGB(255, 10, 161, 188),
          ])),
      child: Center(
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/dice_bg1.png'),
            ),
            borderRadius: BorderRadius.all(Radius.circular(20)),
            // border: Border.all(
            //   color: Colors.black,
            //   width: 3,
            // ),
          ),
          child: DiceDesign(dice_number: dice_number),
        ),
      ),
    );
  }
}
