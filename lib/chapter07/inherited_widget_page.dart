import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/xq_scaffold.dart';

/// User: xiaoquanluo
/// Date: 2023/1/20
/// description: 数据共享
class InheritedWidgetPage extends StatefulWidget {
  const InheritedWidgetPage({Key? key}) : super(key: key);

  @override
  State<InheritedWidgetPage> createState() => _InheritedWidgetPageState();
}

class _InheritedWidgetPageState extends State<InheritedWidgetPage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return XqScaffold(
      title: '数据共享',
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ShareDataWidget(
              data: count,
              child: const _TestWidget1(),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  count++;
                });
              },
              child: const Text('累加'),
            ),
          ],
        ),
      ),
    );
  }
}

/// 数据共享Widget
class ShareDataWidget extends InheritedWidget {
  const ShareDataWidget({required this.data, required Widget child, Key? key}) : super(child: child, key: key);

  /// 需要在子树中共享的数据
  final int data;

  /// 定义一个快捷方法，方便子树的widget获取共享数据
  static ShareDataWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ShareDataWidget>();
  }

  /// 该回调决定当data发生变化时，是否通知子树中依赖data的Widget重新build
  @override
  bool updateShouldNotify(covariant ShareDataWidget oldWidget) {
    return oldWidget.data != data;
  }
}

/// 子组件
class _TestWidget1 extends StatefulWidget {
  const _TestWidget1({Key? key}) : super(key: key);

  @override
  State<_TestWidget1> createState() => _TestWidget1State();
}

class _TestWidget1State extends State<_TestWidget1> {
  @override
  Widget build(BuildContext context) {
    /// 使用共享数据
    return Text(
      ShareDataWidget.of(context)?.data.toString() ?? '',
      style: const TextStyle(fontSize: 20, color: Colors.blue),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
    //如果build中没有依赖InheritedWidget，则此回调不会被调用。
    print("Dependencies change");
  }
}
