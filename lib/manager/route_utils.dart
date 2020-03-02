import 'package:flutter/material.dart';

/// User: luoxiaoquan
/// Date: 2020-03-02
/// description: 页面路由
class RouteUtils {
  /// 页面跳转
  static void push(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return page;
    }));
  }

  ///退出页面
  static void pop(BuildContext context) {
    Navigator.pop(context);
  }
}
