import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_demo/widget/xq_scaffold.dart';

/// User: xiaoquanluo
/// Date: 2023/1/25
/// description: 自定义监听
class PointerDownListenerPage extends StatefulWidget {
  const PointerDownListenerPage({Key? key}) : super(key: key);

  @override
  State<PointerDownListenerPage> createState() => _PointerDownListenerPageState();
}

class _PointerDownListenerPageState extends State<PointerDownListenerPage> {
  @override
  Widget build(BuildContext context) {
    return XqScaffold(
      title: 'PointerDownListenerPage',
      body: Center(
        child: PointerDownListener(
          child: const Text('Click me'),
          onPointerDown: (e) => print('down'),
        ),
      ),
    );
  }
}

class PointerDownListener extends SingleChildRenderObjectWidget {
  const PointerDownListener({Key? key, this.onPointerDown, Widget? child}) : super(key: key, child: child);

  final PointerDownEventListener? onPointerDown;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderPointerDownListener()..onPointerDown = onPointerDown;
  }

  @override
  void updateRenderObject(BuildContext context, RenderPointerDownListener renderObject) {
    renderObject.onPointerDown = onPointerDown;
  }
}

class RenderPointerDownListener extends RenderProxyBox {
  PointerDownEventListener? onPointerDown;

  @override
  bool hitTestSelf(Offset position) => true; //始终通过命中测试

  @override
  void handleEvent(PointerEvent event, covariant HitTestEntry entry) {
    //事件分发时处理事件
    if (event is PointerDownEvent) onPointerDown?.call(event);
  }
}
