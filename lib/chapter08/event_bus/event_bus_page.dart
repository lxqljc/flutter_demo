import 'package:flutter/material.dart';
import 'package:flutter_demo/chapter08/event_bus/event_bus.dart';
import 'package:flutter_demo/widget/xq_scaffold.dart';

/// User: xiaoquanluo
/// Date: 2023/1/26
/// description: 事件总线demo
class EventBusPage extends StatefulWidget {
  const EventBusPage({Key? key}) : super(key: key);

  @override
  State<EventBusPage> createState() => _EventBusPageState();
}

class _EventBusPageState extends State<EventBusPage> {
  int counter = 0;

  @override
  void initState() {
    bus.on('counter', (args) {
      print('args--->$args');
      setState(() {
        counter++;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return XqScaffold(
      title: 'EventBusPage',
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '$counter',
              style: const TextStyle(fontSize: 16),
            ),
            ElevatedButton(
              onPressed: () {
                bus.emit('counter', '哈哈哈');
              },
              child: const Text('添加'),
            )
          ],
        ),
      ),
    );
  }
}
