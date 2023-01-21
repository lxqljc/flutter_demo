import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/xq_scaffold.dart';

/// User: xiaoquanluo
/// Date: 2023/1/21
/// description: StreamBuilder用法
class StreamBuilderPage extends StatefulWidget {
  const StreamBuilderPage({Key? key}) : super(key: key);

  @override
  State<StreamBuilderPage> createState() => _StreamBuilderPageState();
}

class _StreamBuilderPageState extends State<StreamBuilderPage> {
  @override
  Widget build(BuildContext context) {
    return XqScaffold(
      title: 'StreamBuilderPage',
      body: Center(
        child: StreamBuilder(
          stream: counter(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Text('没有数据');
              case ConnectionState.waiting:
                return const Text('等待数据');
              case ConnectionState.active:
                return Text('激活数据-->${snapshot.data}');
              case ConnectionState.done:
                return const Text('完成');
            }
          },
        ),
      ),
    );
  }

  // 每一秒生成一个数
  Stream<int> counter() {
    return Stream.periodic(const Duration(seconds: 1), (i) => i);
  }
}
