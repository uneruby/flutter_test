import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river/lucky.dart';
import 'package:river/unluckey.dart';

import 'dart:math' as math;

main() {
  const app = MaterialApp(home: Sample());
  const scope = ProviderScope(child: app);
  runApp(scope);
}

//当たり・ハズレを決定する乱数の初期値を設定
final stateProvider = StateProvider<num>((ref) {
  return 0;
});

class Sample extends ConsumerWidget {
  const Sample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(stateProvider);

    return Scaffold(
      body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              //当たりorハズレ図柄
              state == 5
                  ? luckey(
                      key: key,
                    )
                  : unluckey(
                      key: key,
                    ),
              //抽選ボタン,
              ElevatedButton(onPressed: () => tapA(ref), child: const Text('A'))
            ],
          )),
    );
  }

  //当たり・ハズレを決定する乱数を生成
  tapA(WidgetRef ref) {
    final notifier = ref.read(stateProvider.notifier);
    notifier.state = math.Random().nextInt(7);
  }
}
