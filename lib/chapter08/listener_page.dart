import 'package:flutter/material.dart';

/// User: xiaoquanluo
/// Date: 2023/1/22
/// description: Listener监听
class ListenerPage extends StatefulWidget {
  const ListenerPage({Key? key}) : super(key: key);

  @override
  State<ListenerPage> createState() => _ListenerPageState();
}

class _ListenerPageState extends State<ListenerPage> {
  /// 指针事件
  PointerEvent? _event;

  @override
  Widget build(BuildContext context) {
    return Listener(
      child: Material(
        child: Container(
          color: Colors.blue,
          height: 150,
          width: 300,
          alignment: Alignment.center,
          child: Text(
            '${_event?.localPosition ?? ''}',
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ),
      ),
      onPointerDown: (PointerDownEvent event) {
        setState(() {
          _event = event;
        });
      },
      onPointerMove: (PointerMoveEvent event) {
        setState(() {
          _event = event;
        });
      },
      onPointerUp: (PointerUpEvent event) {
        setState(() {
          _event = event;
        });
      },
    );
  }
}
