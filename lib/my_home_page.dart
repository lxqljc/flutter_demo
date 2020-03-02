import 'package:flutter/material.dart';
import 'package:flutter_demo/manager/route_utils.dart';
import 'package:flutter_demo/page/reorderable_listview_page.dart';

/// User: luoxiaoquan
/// Date: 2020-03-02
/// description: 首页
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> _list = List();
  static const String _item1 = "可拖拽的listview";

  @override
  void initState() {
    _list.add(_item1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'flutter 学习demo',
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
      ),
      body: ListView.separated(
        itemCount: _list.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return _buildItem(index);
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 10);
        },
      ),
    );
  }

  ///item widget
  _buildItem(int index) {
    return Material(
      child: InkWell(
        onTap: () {
          switch (_list[index]) {
            case _item1:
              RouteUtils.push(context, ReorderableListViewPage());
              break;
          }
        },
        child: Container(
          color: Colors.grey,
          padding: EdgeInsets.all(10),
          child: Text(
            _list[index],
            style: TextStyle(fontSize: 15, color: Colors.black87),
          ),
        ),
      ),
    );
  }
}
