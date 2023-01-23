import 'package:flutter/material.dart';
import 'package:flutter_demo/utils/route_utils.dart';
import 'package:flutter_demo/widget/xq_list_view.dart';
import 'package:flutter_demo/widget/xq_scaffold.dart';

/// User: xiaoquanluo
/// Date: 2023/1/20
/// description: 第七章页面
class Chapter08Page extends StatelessWidget {
  const Chapter08Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return XqScaffold(
      body: XqListView(
        onTap: (String text) {
          switch (text) {
            case 'ListenerPage':
              RouteUtils.push(name: '/chapter08/ListenerPage');
              break;
          }
        },
        texts: const [
          'ListenerPage',
        ],
      ),
      title: '第八章',
    );
  }
}
