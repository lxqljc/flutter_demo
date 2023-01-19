import 'package:flutter/material.dart';
import 'package:flutter_demo/chapter07/chapt07_page.dart';
import 'package:flutter_demo/chapter07/inherited_widget_page.dart';
import 'package:flutter_demo/chapter07/will_pop_scope_page.dart';

/// User: xiaoquanluo
/// Date: 2023/1/20
/// description: 路由工具
class RouteUtils {
  /// 全局路由key
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  /// 导航到新路由
  static Future<dynamic> push({required String name}) async {
    return Navigator.push(
      navigatorKey.currentContext!,
      MaterialPageRoute(builder: (context) {
        switch (name) {
          case '/Chapt07Page':
            return const Chapt07Page();
          case '/chapter07/WillPopScopePage':
            return const WillPopScopePage();
          case '/chapter07/InheritedWidgetPage':
            return const InheritedWidgetPage();
        }
        return const SizedBox.shrink();
      }),
    );
  }

  /// 回退路由
  static Future<dynamic> pop({dynamic result}) async {
    return Navigator.pop(navigatorKey.currentContext!, result);
  }
}
