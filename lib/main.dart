import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river/view/home_page.dart';
import 'package:river/view/home_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
<<<<<<< Updated upstream
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(stateProvider);

    return Scaffold(
      body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
=======
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter MVVM',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(key: key),
>>>>>>> Stashed changes
    );
  }
}
