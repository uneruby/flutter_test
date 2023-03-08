import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river/model/home_page_state.dart';
import 'dart:async';
import 'dart:math' as math;

class HomePageNotifier extends StateNotifier<HomePageState> {
  // 初期値の指定
  HomePageNotifier() : super(const HomePageState());

  // 表示する図柄を決定する乱数を生成する
  void setIndex() async {
    state = state.copyWith(index: math.Random().nextInt(8));
    print("setIndex: 更新後の値 ${state.index}");
  }

  // 表示状態に切り替える
  Future setAppearenceTimeL() async {
    await Future.delayed(const Duration(seconds: 1));
    state = state.copyWith(visibleL: true);
    print("setAppearenceTime: 更新後の値 ${state.visibleL}");
  }

  Future setAppearenceTimeC() async {
    await Future.delayed(const Duration(seconds: 1));
    state = state.copyWith(visibleC: true);
    print("setAppearenceTime: 更新後の値 ${state.visibleC}");
  }

  Future setAppearenceTimeR() async {
    await Future.delayed(const Duration(seconds: 1));
    state = state.copyWith(visibleR: true);
    print("setAppearenceTime: 更新後の値 ${state.visibleR}");
  }

  // すべてのカウントを0に戻す
  Future decideResult() async {
    state = state.copyWith(
      visibleL: false,
      visibleC: false,
      visibleR: false,
      result: math.Random().nextBool(),
    );
    print("setResult: 更新後の値 ${state.result}");
  }

  // 抽選開始
  void lotteryStart() async {
    print(state.visibleL);
    await decideResult();
    setIndex();
    await setAppearenceTimeL();
    await setAppearenceTimeR();
    await setAppearenceTimeC();
    // Timer(Duration(seconds: 2), setAppearenceTimeR);
    // Timer(Duration(seconds: 3), setAppearenceTimeC);
    //setAppearenceTime();
  }
}

// HomePageNotifierの状態を管理する
final homePageProvider =
    StateNotifierProvider.autoDispose<HomePageNotifier, HomePageState>(
  (ref) => HomePageNotifier(),
);
