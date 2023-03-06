import 'package:flutter/material.dart';
import '../class/zugara.dart';
import 'dart:math' as math;

class winDirection1 extends StatelessWidget {
  const winDirection1({super.key});

  @override
  Widget build(BuildContext context) {
    Zugara zugara = Zugara();
    var index = math.Random().nextInt(8);
    return Row(
      // mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: Image.asset(zugara.items[index])),
        Expanded(child: Image.asset(zugara.items[index])),
        Expanded(child: Image.asset(zugara.items[index])),
      ],
    );
  }
}
