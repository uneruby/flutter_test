import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:river/winDirections/win_direction1.dart';

class luckey extends StatelessWidget {
  const luckey({super.key});

  @override
  Widget build(BuildContext context) {
    var zugara = math.Random().nextInt(7);
    return Container(alignment: Alignment.center, child: const winDirection1());
  }
}
