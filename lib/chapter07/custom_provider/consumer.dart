import 'package:flutter/material.dart';
import 'package:flutter_demo/chapter07/custom_provider/change_notifier_provider.dart';

/// User: xiaoquanluo
/// Date: 2023/1/20
/// description: 这是一个便捷类，会获得当前context和指定数据类型的Provider
class Consumer<T> extends StatelessWidget {
  const Consumer({
    Key? key,
    required this.builder,
  }) : super(key: key);

  final Widget Function(BuildContext context, T? value) builder;

  @override
  Widget build(BuildContext context) {
    return builder(
      context,
      ChangeNotifierProvider.of<T>(context),
    );
  }
}
