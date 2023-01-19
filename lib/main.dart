import 'package:flutter/material.dart';
import 'package:flutter_demo/utils/route_utils.dart';
import 'package:flutter_demo/widget/xq_list_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: RouteUtils.navigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _listView(),
    );
  }

  /// 列表
  Widget _listView() {
    return XqListView(
      onTap: (String text) {
        switch (text) {
          case '第七章':
            RouteUtils.push(name: '/Chapt07Page');
            break;
        }
      },
      texts: const <String>['第七章'],
    );
  }
}
