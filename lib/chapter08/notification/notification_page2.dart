import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/xq_scaffold.dart';

/// User: xiaoquanluo
/// Date: 2023/1/26
/// description: 通知监听
class NotificationPage2 extends StatefulWidget {
  const NotificationPage2({Key? key}) : super(key: key);

  @override
  State<NotificationPage2> createState() => _NotificationPage2State();
}

class _NotificationPage2State extends State<NotificationPage2> {
  String msg = '';

  @override
  Widget build(BuildContext context) {
    return XqScaffold(
        title: 'NotificationPage2',
        body: NotificationListener<MyNotification>(
          onNotification: (notification) {
            setState(() {
              msg = notification.msg;
            });
            return true;
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  msg,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 30,
                ),
                Builder(builder: (context) {
                  return ElevatedButton(
                    onPressed: () {
                      int mill = DateTime.now().millisecondsSinceEpoch;
                      String msg = mill % 2 == 0 ? '床前明月光，疑似地上霜' : '举头望明月，低头思故乡';
                      MyNotification(msg).dispatch(context);
                    },
                    child: const Text("Send Notification"),
                  );
                }),
              ],
            ),
          ),
        ));
  }
}

/// 自定义通知
class MyNotification extends Notification {
  MyNotification(this.msg);

  final String msg;
}
