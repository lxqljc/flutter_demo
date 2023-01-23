import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/xq_scaffold.dart';

/// User: xiaoquanluo
/// Date: 2023/1/23
/// description: 缩放page
class DragScalePage extends StatefulWidget {
  const DragScalePage({Key? key}) : super(key: key);

  @override
  State<DragScalePage> createState() => _DragScalePageState();
}

class _DragScalePageState extends State<DragScalePage> {
  double _width = 200.0; //通过修改图片宽度来达到缩放效果

  @override
  Widget build(BuildContext context) {
    return XqScaffold(
      title: 'DragScalePage',
      body: Center(
        child: GestureDetector(
          //指定宽度，高度自适应
          child: Image.asset(
            "assets/images/test.webp",
            width: _width,
            fit: BoxFit.cover,
          ),
          onScaleUpdate: (ScaleUpdateDetails details) {
            setState(
              () {
                //缩放倍数在0.8到10倍之间
                _width = 200 * details.scale.clamp(.8, 10.0);
                print('_width--->$_width');
              },
            );
          },
          onDoubleTap: () {
            setState(() {
              _width = 200 * MediaQuery.of(context).size.height * 0.8;
            });
          },
        ),
      ),
    );
  }
}
