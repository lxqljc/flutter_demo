import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/xq_scaffold.dart';

/// User: xiaoquanluo
/// Date: 2023/1/20
/// description: 导航返回拦截
class WillPopScopePage extends StatefulWidget {
  const WillPopScopePage({Key? key}) : super(key: key);

  @override
  State<WillPopScopePage> createState() => _WillPopScopePageState();
}

class _WillPopScopePageState extends State<WillPopScopePage> {
  /// 上次点击时间
  int? lastPressAt;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        int pressAt = DateTime.now().millisecondsSinceEpoch;
        if (lastPressAt == null || pressAt - lastPressAt! > 300) {
          lastPressAt = pressAt;
          return false;
        }
        return true;
      },
      child: XqScaffold(
        title: 'WillPopScopePage',
        body: Container(
          alignment: Alignment.center,
          child: const Text("1秒内连续按两次返回键退出"),
        ),
      ),
    );
  }
}
