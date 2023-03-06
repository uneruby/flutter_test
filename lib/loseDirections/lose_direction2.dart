import 'package:flutter/material.dart';
import '../class/zugara.dart';

class loseDirection2 extends StatelessWidget {
  const loseDirection2({super.key});

  @override
  Widget build(BuildContext context) {
    Zugara zugara = Zugara();
    return Row(
      // mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: Image.asset(zugara.items[2])),
        Expanded(child: Image.asset(zugara.items[0])),
        Expanded(child: Image.asset(zugara.items[2])),
      ],
    );
  }
}
