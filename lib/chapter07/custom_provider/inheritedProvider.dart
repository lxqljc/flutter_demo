import 'package:flutter/material.dart';

/// User: xiaoquanluo
/// Date: 2023/1/20
/// description:  一个通用的InheritedWidget，保存需要跨组件共享的状态
class InheritProvider<T> extends InheritedWidget {
  const InheritProvider({required Widget child, required this.data, Key? key}) : super(child: child, key: key);

  final T data;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    //在此简单返回true，则每次更新都会调用依赖其的子孙节点的`didChangeDependencies`
    return true;
  }
}
