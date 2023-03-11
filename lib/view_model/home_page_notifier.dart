import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river/model/home_page_state.dart';
import 'dart:async';
import 'dart:math' as math;

import 'package:river/model/num_images.dart';

class HomePageNotifier extends StateNotifier<HomePageState> {
  // 初期値の指定
  HomePageNotifier() : super(const HomePageState());
  // 図柄リストのインスタンス生成
  numImages num = numImages();

  // 表示する図柄を決定する乱数を生成する
  void setIndex(int indexL, indexC, indexR) async {
    state = state.copyWith(indexL: indexL, indexC: indexC, indexR: indexR);
    //print("setIndex: 更新後の値 ${state.indexL}");
  }

  // 表示状態に切り替える
  Future setAppearenceTime(int delayL, delayR, delayC) async {
    await Future.delayed(Duration(milliseconds: delayL));
    state = state.copyWith(visibleL: true);
    await Future.delayed(Duration(milliseconds: delayR));
    state = state.copyWith(visibleR: true);
    await Future.delayed(Duration(milliseconds: delayC));
    state = state.copyWith(visibleC: true);
    //print("setAppearenceTime: 更新後の値 ${state.visibleL}");
  }

  setResult() {
    var temp = math.Random().nextInt(8);
    var resultState = true;
    if (temp == 1) {
      return resultState = true;
    } else {
      return resultState = false;
    }
  }

  // すべてのカウントを0に戻す
  Future decideResult() async {
    state = state.copyWith(
      visibleL: false,
      visibleC: false,
      visibleR: false,
      result: setResult(),
    );
    //print("setResult: 更新後の値 ${state.result}");
  }

  Future setAngle() async {
    //state = state.copyWith(handleAngle: 60);
    print("変更前: $state.loopState");
    state = state.copyWith(handleAngle: state.loopState ? 60 : 0);
    print("変更後: $state.loopState");
  }

  // 抽選開始
  Future lotteryStart() async {
    //print(state.visibleL);
    await decideResult();
    if (state.result) {
      // 演出決定用の乱数生成
      var winDirection = math.Random().nextInt(1);
      //図柄決定用のシャッフル
      num.indexs.shuffle();
      switch (winDirection) {
        case 0:
          setIndex(num.indexs[0], num.indexs[0], num.indexs[0]);
          await setAppearenceTime(500, 500, 500);
          state = state.copyWith(loopState: false, handleAngle: 0);
      }
    } else {
      // 演出決定用の乱数生成
      var loseDirection = math.Random().nextInt(5);
      //図柄決定用のシャッフル
      num.indexs.shuffle();
      switch (loseDirection) {
        case 0:
          setIndex(num.indexs[0], num.indexs[1], num.indexs[0]);
          await setAppearenceTime(500, 500, 500);
          await Future.delayed(const Duration(milliseconds: 1000));
          break;
        default:
          setIndex(num.indexs[0], num.indexs[1], num.indexs[2]);
          await setAppearenceTime(300, 300, 300);
          await Future.delayed(const Duration(milliseconds: 500));
      }
    }
  }

  void loopLottery() async {
    state = state.copyWith(loopState: !state.loopState);
    await setAngle();
    while (state.loopState) {
      //print("3:$state.loopState");
      await lotteryStart();
    }
  }
}

// HomePageNotifierの状態を管理する
final homePageProvider =
    StateNotifierProvider.autoDispose<HomePageNotifier, HomePageState>(
  (ref) => HomePageNotifier(),
);
