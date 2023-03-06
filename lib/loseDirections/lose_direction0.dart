import 'package:flutter/material.dart';
import '../class/zugara.dart';

class loseDirection0 extends StatelessWidget {
  const loseDirection0({super.key});

  @override
  Widget build(BuildContext context) {
    Zugara zugara = Zugara();
    var list = [0, 1, 2, 3, 4, 5, 6, 7];
    list.shuffle();

    return Row(
      children: [
        Expanded(child: Image.asset(zugara.items[list[0]])),
        Expanded(child: Image.asset(zugara.items[list[1]])),
        Expanded(child: Image.asset(zugara.items[list[2]])),
      ],
    );
  }
}
