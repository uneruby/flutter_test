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
  void setAppearenceTime() async {
    state = state.copyWith(visible: true);
    print("setAppearenceTime: 更新後の値 ${state.visible}");
  }

  // すべてのカウントを0に戻す
  void decideResult() async {
    state = state.copyWith(
      visible: false,
      result: math.Random().nextBool(),
    );
    print("setResult: 更新後の値 ${state.result}");
  }

  void lotteryStart() async {
    decideResult();
    Timer(Duration(seconds: 1), setAppearenceTime);
    setIndex();
    //setAppearenceTime();
  }
}

// HomePageNotifierの状態を管理する
final homePageProvider =
    StateNotifierProvider.autoDispose<HomePageNotifier, HomePageState>(
  (ref) => HomePageNotifier(),
);
