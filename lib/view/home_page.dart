import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:river/class/zugara.dart';
// import 'package:river/lucky.dart';
// import 'package:river/unluckey.dart';

import 'package:river/model/home_page_state.dart';
import 'package:river/view/home_page.dart';
import 'package:river/view_model/home_page_notifier.dart';
import 'package:river/model/num_images.dart';

import 'dart:math' as math;

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // state（状態）
    final _homePageState = ref.watch(homePageProvider);
    // provider（状態の操作）
    final _homePageNotifier = ref.watch(homePageProvider.notifier);

    numImages images = numImages();

    return Scaffold(
      body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                      child: Visibility(
                          visible: _homePageState.visibleL,
                          child:
                              Image.asset(images.items[_homePageState.index]))),
                  Expanded(
                      child: Visibility(
                          visible: _homePageState.visibleC,
                          child:
                              Image.asset(images.items[_homePageState.index]))),
                  Expanded(
                      child: Visibility(
                          visible: _homePageState.visibleR,
                          child:
                              Image.asset(images.items[_homePageState.index]))),
                ],
              ),
              ElevatedButton(
                  onPressed: _homePageNotifier.lotteryStart,
                  child: const Text("抽選"))
            ],
          )),
    );
  }
}

//当たり・ハズレを決定する乱数の初期値を設定
// final stateProvider = StateProvider<num>((ref) {
//   return 0;
// });

// class Sample extends ConsumerWidget {
//   const Sample({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final state = ref.watch(stateProvider);

//     return Scaffold(
//       body: SizedBox(
//           width: double.infinity,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               //当たりorハズレ図柄
//               state == 5
//                   ? luckey(
//                       key: key,
//                     )
//                   : unluckey(
//                       key: key,
//                     ),
//               //抽選ボタン,
//               ElevatedButton(onPressed: () => tapA(ref), child: const Text('A'))
//             ],
//           )),
//     );
//   }

//   //当たり・ハズレを決定する乱数を生成
//   tapA(WidgetRef ref) {
//     final notifier = ref.read(stateProvider.notifier);
//     notifier.state = math.Random().nextInt(7);
//   }
// }
