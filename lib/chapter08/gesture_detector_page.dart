import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/xq_scaffold.dart';

/// User: xiaoquanluo
/// Date: 2023/1/23
/// description: GestureDetector示例
class GestureDetectorPage extends StatefulWidget {
  const GestureDetectorPage({Key? key}) : super(key: key);

  @override
  State<GestureDetectorPage> createState() => _GestureDetectorPageState();
}

class _GestureDetectorPageState extends State<GestureDetectorPage> {
  String _operation = "No Gesture detected!"; //保存事件名

  @override
  Widget build(BuildContext context) {
    return XqScaffold(
      title: 'GestureDetector',
      body: Center(
        child: GestureDetector(
          child: Container(
            height: 100,
            width: 200,
            alignment: Alignment.center,
            color: Colors.blue,
            child: Text(
              _operation,
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
          onTap: () => updateText("onTap"),
          onDoubleTap: () => updateText('onDoubleTap'),
          onLongPress: () => updateText('onLongPress'),
        ),
      ),
    );
  }

  void updateText(String text) {
    //更新显示的事件名
    setState(() {
      _operation = text;
    });
  }
}
