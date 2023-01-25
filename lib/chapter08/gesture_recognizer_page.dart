import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/xq_scaffold.dart';

/// User: xiaoquanluo
/// Date: 2023/1/24
/// description: 手势识别器
class GestureRecognizerPage extends StatefulWidget {
  const GestureRecognizerPage({Key? key}) : super(key: key);

  @override
  State<GestureRecognizerPage> createState() => _GestureRecognizerPageState();
}

class _GestureRecognizerPageState extends State<GestureRecognizerPage> {
  /// 手势识别器
  final TapGestureRecognizer _tapGestureRecognizer = TapGestureRecognizer();

  /// 变色开关
  bool _toggle = false;

  @override
  void dispose() {
    //用到GestureRecognizer的话一定要调用其dispose方法释放资源
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return XqScaffold(
        title: 'GestureRecognizerPage',
        body: Center(
          child: Text.rich(TextSpan(children: [
            const TextSpan(text: "你好世界"),
            TextSpan(
              text: "点我变色",
              style: TextStyle(
                fontSize: 30.0,
                color: _toggle ? Colors.blue : Colors.red,
              ),
              recognizer: _tapGestureRecognizer
                ..onTap = () {
                  setState(() {
                    _toggle = !_toggle;
                  });
                },
            ),
            const TextSpan(text: "你好世界"),
          ])),
        ));
  }
}
