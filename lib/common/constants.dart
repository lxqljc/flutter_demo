import 'package:flutter/material.dart';

/// User: luoxiaoquan
/// Date: 2020-03-02
/// description:
class Constants {
  //配置全局key，方便拿到基础属性
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static NavigatorState get navigatorState =>
      Constants.navigatorKey.currentState;

  static BuildContext get currentContext => navigatorState.context;

  static ThemeData get currentTheme => Theme.of(currentContext);
}
