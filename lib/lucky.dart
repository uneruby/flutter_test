import 'package:flutter/material.dart';
import 'dart:math' as math;

class luckey extends StatelessWidget {
  const luckey({super.key});

  @override
  Widget build(BuildContext context) {
    var zugara = math.Random().nextInt(7);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(zugara.toString()),
        Text(zugara.toString()),
        Text(zugara.toString()),
      ],
    );
  }
}
