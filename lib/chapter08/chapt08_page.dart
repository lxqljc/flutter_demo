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
            case 'ListenerPage2':
              RouteUtils.push(name: '/chapter08/ListenerPage2');
              break;
            case 'GestureDetectorPage':
              RouteUtils.push(name: '/chapter08/GestureDetectorPage');
              break;
            case 'DragPage':
              RouteUtils.push(name: '/chapter08/DragPage');
              break;
            case 'DragVerticalPage':
              RouteUtils.push(name: '/chapter08/DragVerticalPage');
              break;
            case 'DragScalePage':
              RouteUtils.push(name: '/chapter08/DragScalePage');
              break;
            case 'GestureRecognizerPage':
              RouteUtils.push(name: '/chapter08/GestureRecognizerPage');
              break;
              case 'PointerDownListenerPage':
              RouteUtils.push(name: '/chapter08/PointerDownListenerPage');
              break;
          }
        },
        texts: const [
          'ListenerPage',
          'ListenerPage2',
          'GestureDetectorPage',
          'DragPage',
          'DragVerticalPage',
          'DragScalePage',
          'GestureRecognizerPage',
          'PointerDownListenerPage',
        ],
      ),
      title: '第八章',
    );
  }
}
