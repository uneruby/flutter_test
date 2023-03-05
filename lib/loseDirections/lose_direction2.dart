import 'package:flutter/material.dart';

class loseDirection2 extends StatelessWidget {
  const loseDirection2({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: Image.asset('images/two.png')),
        Expanded(child: Image.asset('images/zero.png')),
        Expanded(child: Image.asset('images/two.png')),
      ],
    );
  }
}
