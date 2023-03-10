import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river/model/home_page_state.dart';
import 'dart:async';
import 'dart:math' as math;

import 'package:river/model/num_images.dart';

class HomePageNotifier extends StateNotifier<HomePageState> {
  // 初期値の指定
  HomePageNotifier() : super(const HomePageState());
  numImages num = numImages();

  // 表示する図柄を決定する乱数を生成する
  void setIndexL(int index) async {
    state = state.copyWith(indexL: index);
    //print("setIndex: 更新後の値 ${state.indexL}");
  }

  void setIndexC(int index) async {
    state = state.copyWith(indexC: index);
    //print("setIndex: 更新後の値 ${state.indexC}");
  }

  void setIndexR(int index) async {
    state = state.copyWith(indexR: index);
    //print("setIndex: 更新後の値 ${state.indexR}");
  }

  // 表示状態に切り替える
  Future setAppearenceTimeL() async {
    await Future.delayed(const Duration(seconds: 1));
    state = state.copyWith(visibleL: true);
    //print("setAppearenceTime: 更新後の値 ${state.visibleL}");
  }

  Future setAppearenceTimeC() async {
    await Future.delayed(const Duration(seconds: 1));
    state = state.copyWith(visibleC: true);
    //print("setAppearenceTime: 更新後の値 ${state.visibleC}");
  }

  Future setAppearenceTimeR() async {
    await Future.delayed(const Duration(seconds: 1));
    state = state.copyWith(visibleR: true);
    //print("setAppearenceTime: 更新後の値 ${state.visibleR}");
  }

  // すべてのカウントを0に戻す
  Future decideResult() async {
    state = state.copyWith(
      visibleL: false,
      visibleC: false,
      visibleR: false,
      result: math.Random().nextBool(),
    );
    //print("setResult: 更新後の値 ${state.result}");
  }

  // 抽選開始
  void lotteryStart() async {
    //print(state.visibleL);
    await decideResult();
    if (state.result) {
      var winDirection = math.Random().nextInt(1);
      switch (winDirection) {
        case 0:
          var index = math.Random().nextInt(8);
          setIndexL(num.indexs[index]);
          setIndexC(num.indexs[index]);
          setIndexR(num.indexs[index]);
          await setAppearenceTimeL();
          await setAppearenceTimeR();
          await setAppearenceTimeC();
      }
    } else {
      var loseDirection = math.Random().nextInt(1);
      switch (loseDirection) {
        case 0:
          num.indexs.shuffle();
          setIndexL(num.indexs[0]);
          setIndexC(num.indexs[1]);
          setIndexR(num.indexs[2]);
          await setAppearenceTimeL();
          await setAppearenceTimeR();
          await setAppearenceTimeC();
      }
    }
    // setIndex();
    // await setAppearenceTimeL();
    // await setAppearenceTimeR();
    // await setAppearenceTimeC();
  }
}

// HomePageNotifierの状態を管理する
final homePageProvider =
    StateNotifierProvider.autoDispose<HomePageNotifier, HomePageState>(
  (ref) => HomePageNotifier(),
);
