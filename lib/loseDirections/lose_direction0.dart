import 'package:flutter/material.dart';

class loseDirection0 extends StatelessWidget {
  const loseDirection0({super.key});

  @override
  Widget build(BuildContext context) {
    var items = [
      'images/zero.png',
      'images/one.png',
      'images/two.png',
      'images/three.png',
      'images/four.png',
      'images/five.png',
      'images/six.png',
      'images/seven.png',
    ];
    var list = [0, 1, 2, 3, 4, 5, 6, 7];
    list.shuffle();

    return Row(
      children: [
        Expanded(child: Image.asset(items[list[0]])),
        Expanded(child: Image.asset(items[list[1]])),
        Expanded(child: Image.asset(items[list[2]])),
      ],
    );
  }
}
