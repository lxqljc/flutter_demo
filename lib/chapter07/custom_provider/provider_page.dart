import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/chapter07/custom_provider/cart_model.dart';
import 'package:flutter_demo/chapter07/custom_provider/change_notifier_provider.dart';
import 'package:flutter_demo/chapter07/custom_provider/consumer.dart';
import 'package:flutter_demo/chapter07/custom_provider/item.dart';
import 'package:flutter_demo/widget/xq_scaffold.dart';

/// User: xiaoquanluo
/// Date: 2023/1/20
/// description: 示例页面
class ProviderPage extends StatefulWidget {
  const ProviderPage({Key? key}) : super(key: key);

  @override
  State<ProviderPage> createState() => _ProviderPageState();
}

class _ProviderPageState extends State<ProviderPage> {
  @override
  Widget build(BuildContext context) {
    return XqScaffold(
      title: 'provider_page',
      body: ChangeNotifierProvider<CartModel>(
        data: CartModel(),
        child: Builder(builder: (context) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Consumer<CartModel>(builder: (BuildContext context, CartModel? value) {
                  return Text("总价: ${value?.totalPrice}");
                }),
                Builder(builder: (context) {
                  if (kDebugMode) {
                    print("ElevatedButton build");
                  } //在后面优化部分会用到
                  return ElevatedButton(
                    child: const Text("添加商品"),
                    onPressed: () {
                      //给购物车中添加商品，添加后总价会更新
                      ChangeNotifierProvider.of<CartModel>(context, listen: false).add(Item(price: 20.0, count: 1));
                    },
                  );
                }),
              ],
            ),
          );
        }),
      ),
    );
  }
}
