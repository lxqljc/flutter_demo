import 'package:flutter/material.dart';

/// User: xiaoquanluo
/// Date: 2023/1/20
/// description: 封装listview组件(按钮列表)
class XqListView extends StatelessWidget {
  const XqListView({required this.texts, required this.onTap, Key? key}) : super(key: key);

  /// 按钮文本数组
  final List<String> texts;

  /// 点击回调
  final Function(String text) onTap;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: texts.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: ElevatedButton(
            onPressed: () => onTap.call(texts[index]),
            style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((states) => Colors.blue)),
            child: Text(
              texts[index],
              style: const TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
        );
      },
    );
  }
}
