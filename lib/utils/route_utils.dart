import 'package:flutter/material.dart';
import 'package:flutter_demo/chapter07/alert_dialog_page.dart';
import 'package:flutter_demo/chapter07/chapt07_page.dart';
import 'package:flutter_demo/chapter07/custom_provider/provider_page.dart';
import 'package:flutter_demo/chapter07/future_builder_page.dart';
import 'package:flutter_demo/chapter07/general_dialog_page.dart';
import 'package:flutter_demo/chapter07/inherited_widget_page.dart';
import 'package:flutter_demo/chapter07/stream_builder_page.dart';
import 'package:flutter_demo/chapter07/will_pop_scope_page.dart';
import 'package:flutter_demo/chapter08/chapt08_page.dart';
import 'package:flutter_demo/chapter08/listener_page.dart';

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
          case '/Chapter08Page':
            return const Chapter08Page();
          case '/chapter07/WillPopScopePage':
            return const WillPopScopePage();
          case '/chapter07/InheritedWidgetPage':
            return const InheritedWidgetPage();
          case '/chapter07/ProviderPage':
            return const ProviderPage();
          case '/chapter07/ValueListenablePage':
            return const ProviderPage();
          case '/chapter07/FutureBuilderPage':
            return const FutureBuilderPage();
          case '/chapter07/StreamBuilderPage':
            return const StreamBuilderPage();
          case '/chapter07/AlertDialogPage':
            return const AlertDialogPage();
          case '/chapter07/GeneralDialogPage':
            return const GeneralDialogPage();
          case '/chapter08/ListenerPage':
            return const ListenerPage();
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
