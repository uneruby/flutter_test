import 'package:flutter/material.dart';

class loseDirection1 extends StatelessWidget {
  const loseDirection1({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: Image.asset('images/one.png')),
        Expanded(child: Image.asset('images/zero.png')),
        Expanded(child: Image.asset('images/one.png')),
      ],
    );
  }
}
