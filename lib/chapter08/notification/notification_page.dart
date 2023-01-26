import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/xq_scaffold.dart';

/// User: xiaoquanluo
/// Date: 2023/1/26
/// description: 监听通知
class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return XqScaffold(
        title: 'NotificationPage',
        body: NotificationListener(
          onNotification: (notification) {
            switch (notification.runtimeType) {
              case ScrollStartNotification:
                print('开始滚动');
                break;
              case ScrollUpdateNotification:
                print('正在滚动');
                break;
              case ScrollEndNotification:
                print('滚动停止');
                break;
              case OverscrollNotification:
                print('滚动到边界');
                break;
            }
            return true;
          },
          child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("$index"),
                );
              }),
        ));
  }
}
