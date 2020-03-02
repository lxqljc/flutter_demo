import 'package:flutter/material.dart';

/// User: luoxiaoquan
/// Date: 2020-03-02
/// description:可拖拽的listview排序
class ReorderableListViewPage extends StatefulWidget {
  @override
  _ReorderableListViewPageState createState() =>
      _ReorderableListViewPageState();
}

class _ReorderableListViewPageState extends State<ReorderableListViewPage> {
  List<Map<dynamic, dynamic>> _data = [
    {"num": "0", "color": Colors.blue},
    {'num': "1", "color": Colors.pinkAccent},
    {'num': "2", "color": Colors.deepPurple},
    {'num': "3", "color": Colors.orangeAccent}
  ];

  ///列表项
  List<Widget> _items = List();

  @override
  Widget build(BuildContext context) {
    _items.clear();
    for (int i = 0; i < _data.length; i++) {
      _items.add(Card(
        color: _data[i]['color'],
        key: Key(_data[i]['color'].toString()),
        child: Container(
          width: 300,
          height: 100,
          alignment: Alignment.center,
          child: Text(
            _data[i]['num'],
            style: TextStyle(fontSize: 15),
          ),
        ),
      ));
    }

    return Scaffold(
      appBar: AppBar(title: Text('ReorderableListViewPage')),
      body: ReorderableListView(
        header: Container(
          height: 50,
          color: Colors.black26,
          alignment: Alignment.center,
          child: Text('固定头部，不参与排序'),
        ),
        children: _items,
        onReorder: (oldIndex, newIndex) {
          print('oldIndex->$oldIndex  newIndex->$newIndex');
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            var temp = _data.removeAt(oldIndex);
            _data.insert(newIndex, temp);
            // print('data->$_data');
          });
        },
      ),
    );
  }
}
