// import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_page_state.freezed.dart';

@freezed
class HomePageState with _$HomePageState {
  const factory HomePageState({
    @Default(7) int index,
    @Default(false) bool visibleL,
    @Default(false) bool visibleC,
    @Default(false) bool visibleR,
    @Default(false) bool result,
  }) = _HomePageState;
}
