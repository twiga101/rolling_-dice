import 'package:flutter/material.dart';

class DiceDesign extends StatelessWidget {
  final int dice_number;
  DiceDesign({required this.dice_number});

  @override
  Widget build(BuildContext context) {
    return Center(child: getDice(dice_number));
  }

  Widget getDice(int val) {
    switch (val) {
      case 1:
        return DiceDotShape();
      case 2:
        return Container(
          padding: EdgeInsets.all(12),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    DiceDotShape(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    DiceDotShape(),
                  ],
                ),
              ]),
        );
      case 3:
        return Container(
          padding: EdgeInsets.all(12),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    DiceDotShape(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DiceDotShape(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    DiceDotShape(),
                  ],
                ),
              ]),
        );
      case 4:
        return Container(
          padding: EdgeInsets.all(12),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DiceDotShape(),
                    DiceDotShape(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DiceDotShape(),
                    DiceDotShape(),
                  ],
                ),
              ]),
        );
      case 5:
        return Container(
          padding: EdgeInsets.all(12),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DiceDotShape(),
                    DiceDotShape(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DiceDotShape(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DiceDotShape(),
                    DiceDotShape(),
                  ],
                ),
              ]),
        );
      case 6:
        return Container(
          padding: EdgeInsets.all(12),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DiceDotShape(),
                    DiceDotShape(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DiceDotShape(),
                    DiceDotShape(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DiceDotShape(),
                    DiceDotShape(),
                  ],
                ),
              ]),
        );
      default:
        return Text('nop');
    }
  }

  Container DiceDotShape() {
    return Container(
      width: 15,
      height: 15,
      decoration: BoxDecoration(
        gradient: RadialGradient(colors: [
          Color.fromARGB(255, 53, 217, 229),
          Color.fromARGB(255, 10, 120, 188),
        ]),
        shape: BoxShape.circle,
      ),
    );
  }
}
