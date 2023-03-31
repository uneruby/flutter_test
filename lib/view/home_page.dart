import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river/model/home_page_state.dart';
import 'package:river/view/home_page.dart';
import 'package:river/view_model/home_page_notifier.dart';
import 'package:river/model/num_images.dart';
import 'dart:math';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;

    // state（状態）
    final _homePageState = ref.watch(homePageProvider);
    // provider（状態の操作）
    final _homePageNotifier = ref.watch(homePageProvider.notifier);

    numImages images = numImages();

    return Scaffold(
      body: SizedBox(
          width: double.infinity,
          child: Container(
              alignment: Alignment.center,
              child: AspectRatio(
                  aspectRatio: 3 / 4,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.blue,
                        image: DecorationImage(
                          image: AssetImage('images/mockKYOUTAI.png'),
                        )),
                    child: Stack(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Positioned(
                              top: deviceWidth * 0.2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Visibility(
                                    maintainSize: true,
                                    maintainState: true,
                                    maintainAnimation: true,
                                    visible: _homePageState.visibleL,
                                    child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(color: Colors.red),
                                        ),
                                        height: deviceWidth * 0.4,
                                        child: Image.asset(images
                                            .items[_homePageState.indexL])),
                                  ),
                                  Visibility(
                                      maintainSize: true,
                                      maintainState: true,
                                      maintainAnimation: true,
                                      visible: _homePageState.visibleC,
                                      child: Container(
                                          height: deviceWidth * 0.4,
                                          child: Image.asset(images
                                              .items[_homePageState.indexC]))),
                                  Visibility(
                                      maintainSize: true,
                                      maintainState: true,
                                      maintainAnimation: true,
                                      visible: _homePageState.visibleR,
                                      child: Container(
                                          height: deviceWidth * 0.4,
                                          child: Image.asset(images
                                              .items[_homePageState.indexR]))),
                                ],
                              )),
                          Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                  height: deviceWidth * 0.4,
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: Colors.black26,
                                    border: Border.all(color: Colors.black45),
                                    borderRadius: const BorderRadius.horizontal(
                                        left: Radius.circular(20)),
                                  ),
                                  child: InkResponse(
                                    onTap: () {
                                      _homePageNotifier.loopLottery();
                                    },
                                    child: Transform.rotate(
                                      angle:
                                          _homePageState.handleAngle * pi / 180,
                                      child: Expanded(
                                          child:
                                              Image.asset("images/handle.png")),
                                    ),
                                  )))
                        ]),
                  )))),
    );
  }
}
