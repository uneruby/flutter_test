import 'package:flutter/material.dart';

class loseDirection3 extends StatelessWidget {
  const loseDirection3({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: Image.asset('images/three.png')),
        Expanded(child: Image.asset('images/zero.png')),
        Expanded(child: Image.asset('images/three.png')),
      ],
    );
  }
}
