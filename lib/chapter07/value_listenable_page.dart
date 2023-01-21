import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/xq_scaffold.dart';

/// User: xiaoquanluo
/// Date: 2023/1/20
/// description: 按需rebuild（ValueListenableBuilder）
class ValueListenablePage extends StatefulWidget {
  const ValueListenablePage({Key? key}) : super(key: key);

  @override
  State<ValueListenablePage> createState() => _ValueListenablePageState();
}

class _ValueListenablePageState extends State<ValueListenablePage> {
  // 定义一个ValueNotifier，当数字变化时会通知 ValueListenableBuilder
  final ValueNotifier<int> _counter = ValueNotifier<int>(0);
  static const double textScaleFactor = 1.5;

  @override
  Widget build(BuildContext context) {
    return XqScaffold(
      title: 'ValueListenableBuilder',
      body: Center(
        child: ValueListenableBuilder(
          builder: (BuildContext context, value, Widget? child) {
            // builder 方法只会在 _counter 变化时被调用
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                child!,
                Text('$value 次', textScaleFactor: textScaleFactor),
              ],
            );
          },
          valueListenable: _counter,
        ),
      ),
      floatingBtn: FloatingActionButton(
        child: const Icon(Icons.add),
        // 点击后值 +1，触发 ValueListenableBuilder 重新构建
        onPressed: () => _counter.value += 1,
      ),
    );
  }
}
