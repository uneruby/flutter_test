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
      // 演出決定用の乱数生成
      var winDirection = math.Random().nextInt(1);
      //図柄決定用のシャッフル
      num.indexs.shuffle();
      switch (winDirection) {
        case 0:
          setIndex(num.indexs[0], num.indexs[0], num.indexs[0]);
          await setAppearenceTime(500, 500, 500);
      }
    } else {
      // 演出決定用の乱数生成
      var loseDirection = math.Random().nextInt(2);
      //図柄決定用のシャッフル
      num.indexs.shuffle();
      switch (loseDirection) {
        case 0:
          setIndex(num.indexs[0], num.indexs[1], num.indexs[0]);
          await setAppearenceTime(500, 500, 500);
          break;
        default:
          setIndex(num.indexs[0], num.indexs[1], num.indexs[2]);
          await setAppearenceTime(500, 500, 500);
      }
    }
  }
}

// HomePageNotifierの状態を管理する
final homePageProvider =
    StateNotifierProvider.autoDispose<HomePageNotifier, HomePageState>(
  (ref) => HomePageNotifier(),
);
