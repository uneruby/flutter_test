import 'package:flutter/material.dart';
import 'package:river/loseDirections/lose_direction1.dart';
import 'package:river/loseDirections/lose_direction2.dart';
import 'package:river/loseDirections/lose_direction3.dart';
import 'dart:math' as math;

class unluckey extends StatelessWidget {
  const unluckey({super.key});

  @override
  Widget build(BuildContext context) {
    // var list = ["0", "1", "2", "3", "4", "5", "6", "7"];
    // list.shuffle();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //shufull(ref),
        decideDirection()
        //directionState == 1 ? const loseDirection1() : const loseDirection2()
        // Text(list[1]),
        // Text(list[2]),
        // Text(list[3]),
      ],
    );
  }

  decideDirection() {
    //演出を決定する乱数を生成
    final directionState = math.Random().nextInt(3);

    //乱数により演出を出し分ける
    switch (directionState) {
      case 0:
        return loseDirection1(
          key: key,
        );
      case 1:
        return loseDirection2(
          key: key,
        );
      case 2:
        return loseDirection3(
          key: key,
        );
      default:
        return const Text("予測される値ではありません");
    }
  }
}
