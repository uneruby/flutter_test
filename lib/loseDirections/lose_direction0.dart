import 'package:flutter/material.dart';

class loseDirection0 extends StatelessWidget {
  const loseDirection0({super.key});

  @override
  Widget build(BuildContext context) {
    var list = ["0", "1", "2", "3", "4", "5", "6", "7"];
    list.shuffle();
    return Row(
      children: [
        Text(list[0].toString()),
        Text(list[1].toString()),
        Text(list[2].toString()),
      ],
    );
  }
}
