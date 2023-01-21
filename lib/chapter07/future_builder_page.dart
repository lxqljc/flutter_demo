import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/xq_scaffold.dart';

/// User: xiaoquanluo
/// Date: 2023/1/21
/// description: future_builder用法
class FutureBuilderPage extends StatefulWidget {
  const FutureBuilderPage({Key? key}) : super(key: key);

  @override
  State<FutureBuilderPage> createState() => _FutureBuilderPageState();
}

class _FutureBuilderPageState extends State<FutureBuilderPage> {
  @override
  Widget build(BuildContext context) {
    return XqScaffold(
        title: 'FutureBuilderPage',
        body: Center(
          child: FutureBuilder<String>(
            future: mockNetworkData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(
                  snapshot.data ?? '',
                  style: const TextStyle(fontSize: 16, color: Colors.blue),
                );
              } else if (snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              }
              return const CircularProgressIndicator();
            },
          ),
        ));
  }

  /// 模拟请求网络
  Future<String> mockNetworkData() {
    return Future.delayed(const Duration(seconds: 2), () => '我是从互联网上获取的数据');
  }
}
