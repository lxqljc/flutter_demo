import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/xq_scaffold.dart';

/// User: xiaoquanluo
/// Date: 2023/1/22
/// description: 弹窗
class AlertDialogPage extends StatefulWidget {
  const AlertDialogPage({Key? key}) : super(key: key);

  @override
  State<AlertDialogPage> createState() => _AlertDialogPageState();
}

class _AlertDialogPageState extends State<AlertDialogPage> {
  @override
  Widget build(BuildContext context) {
    return XqScaffold(
      title: 'AlertDialogPage',
      body: Center(
        child: ElevatedButton(
          child: const Text('alertDialog'),
          onPressed: () async {
            //弹出对话框并等待其关闭
            bool? delete = await showAlertDialog1();
            if (delete == null) {
              print("取消删除");
            } else {
              print("已确认删除");
              //... 删除文件
            }
          },
        ),
      ),
    );
  }

  /// 弹出对话框
  Future<bool?> showAlertDialog1() {
    return showDialog<bool?>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('提示'),
          content: const Text('您确定删除当前文件吗？'),
          actions: <Widget>[
            TextButton(
              child: const Text("取消"),
              onPressed: () => Navigator.of(context).pop(), // 关闭对话框
            ),
            TextButton(
              child: const Text("删除"),
              onPressed: () {
                //关闭对话框并返回true
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }
}
