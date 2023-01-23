import 'package:flutter/material.dart';

/// User: xiaoquanluo
/// Date: 2023/1/22
/// description: Listener监听
class ListenerPage2 extends StatefulWidget {
  const ListenerPage2({Key? key}) : super(key: key);

  @override
  State<ListenerPage2> createState() => _ListenerPage2State();
}

class _ListenerPage2State extends State<ListenerPage2> {
  /// 指针事件
  PointerEvent? _event;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Listener(
            // 当前组件参与命中测试，但不继续传递事件
            child: AbsorbPointer(
              child: Listener(
                child: Container(
                  color: Colors.red,
                  height: 100,
                  width: 200,
                  alignment: Alignment.center,
                ),
                onPointerDown: (event) {
                  print('AbsorbPointer===>in');
                },
              ),
            ),
            onPointerDown: (event) {
              print('AbsorbPointer===>out');
            },
          ),
          const SizedBox(
            height: 50,
          ),
          Listener(
            // 当前组件阻止事件继续传递
            child: IgnorePointer(
              child: Listener(
                child: Container(
                  color: Colors.blue,
                  height: 100,
                  width: 200,
                  alignment: Alignment.center,
                ),
                onPointerDown: (event) {
                  print('IgnorePointer===>in');
                },
              ),
            ),
            onPointerDown: (event) {
              print('IgnorePointer===>out');
            },
          ),
        ],
      ),
    );
  }
}
