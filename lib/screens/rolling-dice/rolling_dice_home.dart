import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:rolling_dice/screens/rolling-dice/widgets/dice.dart';
import 'package:rolling_dice/screens/rolling-dice/widgets/dice_design.dart';
// import 'package:vector_graphics/vector_graphics.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class RollingDice extends StatefulWidget {
  @override
  State<RollingDice> createState() => _RollingDiceState();
}

class _RollingDiceState extends State<RollingDice>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  final List<int> dice_numbers = [];
  int dice_number = Random().nextInt(6) + 1;
  bool _isSix = false;
  bool _isDisabled = false;

  //  ----------- Rolling -------------

  void _startRolling() async {
    setState(() {
      _isDisabled = true;
    });
    final player = AudioPlayer();
    await player.play(AssetSource('dice_sound.mp3'));

    _animationController.repeat();
    await Future.delayed(Duration(milliseconds: 800));
    _animationController.stop();
    if (dice_numbers.last == 6) {
      await Future.delayed(Duration(milliseconds: 200));
      setState(() {
        _isSix = true;
      });
      await Future.delayed(Duration(seconds: 2));
      setState(() {
        _isSix = false;
      });
    }
    setState(() {
      _isDisabled = false;
    });
    // Logger().i(dice_numbers.last);
    dice_numbers.clear();
  }

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 150),
    )..addListener(() {
        final number = Random().nextInt(6) + 1;
        dice_numbers.add(number);
        setState(() {
          dice_number = number;
        });
      });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: Image.asset(
              'assets/background.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: InkWell(
              onTap: _isDisabled ? null : _startRolling,
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..rotateZ(_animationController.value * 3.14),
                    child: child,
                  );
                },
                child: Dice(dice_number: dice_number),
              ),
            ),
          ),

          // Positioned(
          //   bottom: 30,
          //   left: 0,
          //   right: 0,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       ElevatedButton(
          //         style: ButtonStyle(
          //           textStyle: MaterialStateProperty.all(
          //             TextStyle(
          //               fontSize: 22,
          //               fontWeight: FontWeight.bold,
          //             ),
          //           ),
          //         ),
          //         onPressed: _startRolling,
          //         child: Padding(
          //           padding: const EdgeInsets.all(16.0),
          //           child: Text('Roll Dice'),
          //         ),
          //       ),
          //     ],
          //   ),
          // )
          if (_isSix)
            Align(
              alignment: Alignment.center,
              child: Image.asset('assets/celeb-6.gif'),
            ),
        ],
      ),
    );
  }
}
