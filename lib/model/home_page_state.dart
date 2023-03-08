// import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_page_state.freezed.dart';

@freezed
class HomePageState with _$HomePageState {
  const factory HomePageState({
    @Default(7) int index,
    @Default(true) bool visibleL,
    @Default(true) bool visibleC,
    @Default(true) bool visibleR,
    @Default(false) bool result,
  }) = _HomePageState;
}
