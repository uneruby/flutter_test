//import 'dart:ffi';

import 'package:flutter/material.dart';
import '../class/zugara.dart';
import 'dart:async';

class loseDirection0 extends StatefulWidget {
  const loseDirection0({super.key});

  @override
  State<loseDirection0> createState() => _loseDirection0State();
}

class _loseDirection0State extends State<loseDirection0> {
  bool visible = false;
  // void initVisible() {
  //   setState(() {
  //     visible = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    Zugara zugara = Zugara();
    var list = [0, 1, 2, 3, 4, 5, 6, 7];
    list.shuffle();

    @override
    void _onTimer() {
      setState(() {
        visible = true;
      });
      print(visible);
    }

    Timer(Duration(seconds: 5), _onTimer);
    //Timer(Duration(seconds: 3), _onTimer);

    return Row(
      children: [
        Expanded(
            child: Visibility(
                visible: visible, child: Image.asset(zugara.items[list[0]]))),
        Expanded(child: Image.asset(zugara.items[list[1]])),
        Expanded(child: Image.asset(zugara.items[list[2]])),
      ],
    );
  }
}

// class loseDirection0 extends StatelessWidget {
//   loseDirection0({super.key});

//   // var visible = false;

//   // void _onTimer() {
//   //   setState() {
//   //     visible = true;
//   //   }

//   //   print(visible);
//   // }

//   @override
//   Widget build(BuildContext context) {
//     Zugara zugara = Zugara();
//     var list = [0, 1, 2, 3, 4, 5, 6, 7];
//     list.shuffle();

//     var visible = false;

//     void _onTimer() {
//       setState() {
//         visible = true;
//       }

//       print(visible);
//     }

//     Timer(Duration(seconds: 1), _onTimer);
//     //Timer(Duration(seconds: 3), _onTimer);

//     return Row(
//       children: [
//         Expanded(
//             child: Visibility(
//                 visible: visible, child: Image.asset(zugara.items[list[0]]))),
//         Expanded(child: Image.asset(zugara.items[list[1]])),
//         Expanded(child: Image.asset(zugara.items[list[2]])),
//       ],
//     );
//   }
// }


// // void _onTimer() {
// //   setState() {
// //     visible = true;
// //   }
// // }
