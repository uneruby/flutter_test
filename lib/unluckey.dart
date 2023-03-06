import 'package:flutter/material.dart';
import 'package:river/loseDirections/lose_direction0.dart';
import 'package:river/loseDirections/lose_direction1.dart';
import 'package:river/loseDirections/lose_direction2.dart';
import 'package:river/loseDirections/lose_direction3.dart';
import 'dart:math' as math;

class unluckey extends StatelessWidget {
  const unluckey({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(alignment: Alignment.center, child: decideDirection());
  }

  decideDirection() {
    //演出を決定する乱数を生成
    final directionState = math.Random().nextInt(10);

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
        return loseDirection0(
          key: key,
        );
    }
  }
}
