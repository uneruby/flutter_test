import 'dart:math';

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
                          maintainSize: true,
                          maintainState: true,
                          maintainAnimation: true,
                          visible: _homePageState.visibleL,
                          child: Image.asset(
                              images.items[_homePageState.indexL]))),
                  Expanded(
                      child: Visibility(
                          maintainSize: true,
                          maintainState: true,
                          maintainAnimation: true,
                          visible: _homePageState.visibleC,
                          child: Image.asset(
                              images.items[_homePageState.indexC]))),
                  Expanded(
                      child: Visibility(
                          maintainSize: true,
                          maintainState: true,
                          maintainAnimation: true,
                          visible: _homePageState.visibleR,
                          child: Image.asset(
                              images.items[_homePageState.indexR]))),
                ],
              ),
              // ElevatedButton(
              //     onPressed: _homePageNotifier.loopLottery,
              //     child: const Text("抽選")),
              SizedBox(
                  width: 100,
                  height: 100,
                  child: InkResponse(
                    onTap: () {
                      _homePageNotifier.loopLottery();
                    },
                    child: Transform.rotate(
                      angle: _homePageState.handleAngle * pi / 180,
                      child: Image.asset("images/handle.png"),
                    ),
                  ))

              //GestureDetector(child: Image.asset("images/hanle.png"))
            ],
          )),
    );
  }
}
