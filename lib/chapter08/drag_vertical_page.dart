import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/xq_scaffold.dart';

/// User: xiaoquanluo
/// Date: 2023/1/23
/// description: 垂直方向拖拽demo
class DragVerticalPage extends StatefulWidget {
  const DragVerticalPage({Key? key}) : super(key: key);

  @override
  State<DragVerticalPage> createState() => _DragVerticalPageState();
}

class _DragVerticalPageState extends State<DragVerticalPage> {
  double _top = 0.0;

  @override
  Widget build(BuildContext context) {
    return XqScaffold(
        title: 'DragVerticalPage',
        body: Stack(
          children: [
            Positioned(
              top: _top,
              child: GestureDetector(
                child: const CircleAvatar(
                  child: Text('A'),
                ),
                //垂直方向拖动事件
                onVerticalDragUpdate: (DragUpdateDetails details) {
                  setState(() {
                    _top += details.delta.dy;
                  });
                },
              ),
            ),
          ],
        ));
  }
}
