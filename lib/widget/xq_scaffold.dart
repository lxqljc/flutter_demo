import 'package:flutter/material.dart';

/// User: xiaoquanluo
/// Date: 2023/1/20
/// description: 基础骨架
class XqScaffold extends StatelessWidget {
  const XqScaffold({required this.title, required this.body, Key? key}) : super(key: key);

  /// 标题
  final String title;

  /// 内容体
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
      body: body,
    );
  }
}
