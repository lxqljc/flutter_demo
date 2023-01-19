import 'package:flutter/material.dart';
import 'package:flutter_demo/utils/route_utils.dart';
import 'package:flutter_demo/widget/xq_list_view.dart';
import 'package:flutter_demo/widget/xq_scaffold.dart';

/// User: xiaoquanluo
/// Date: 2023/1/20
/// description: 第七章页面
class Chapt07Page extends StatelessWidget {
  const Chapt07Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return XqScaffold(
      body: XqListView(
        onTap: (String text) {
          switch (text) {
            case 'WillPopScope':
              RouteUtils.push(name: '/chapter07/WillPopScopePage');
              break;
            case 'inheritedWidget':
              RouteUtils.push(name: '/chapter07/InheritedWidgetPage');
              break;
          }
        },
        texts: const ['WillPopScope', 'inheritedWidget'],
      ),
      title: '第七章',
    );
  }
}
