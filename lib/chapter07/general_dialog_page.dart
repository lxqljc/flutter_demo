import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/xq_scaffold.dart';

/// User: xiaoquanluo
/// Date: 2023/1/22
/// description: 自定义弹窗(自定义动画)
class GeneralDialogPage extends StatefulWidget {
  const GeneralDialogPage({Key? key}) : super(key: key);

  @override
  State<GeneralDialogPage> createState() => _GeneralDialogPsgeState();
}

class _GeneralDialogPsgeState extends State<GeneralDialogPage> {
  @override
  Widget build(BuildContext context) {
    return XqScaffold(
      title: 'GeneralDialogPage',
      body: Center(
        child: ElevatedButton(
          child: const Text('CustomGeneralDialog'),
          onPressed: () {
            showCustomDialog(
              context: context,
              builder: (BuildContext context) => Material(
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Center(
                      child: Text('测试'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('返回'),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

/// 自定义弹窗
Future<T?> showCustomDialog<T>({
  required BuildContext context,
  bool barrierDismissible = true,
  required WidgetBuilder builder,
  ThemeData? theme,
}) {
  final ThemeData theme = Theme.of(context);
  return showGeneralDialog(
    context: context,
    pageBuilder: (BuildContext buildContext, Animation<double> animation, Animation<double> secondaryAnimation) {
      final Widget pageChild = Builder(builder: builder);
      return SafeArea(
        child: Builder(builder: (BuildContext context) {
          return Theme(data: theme, child: pageChild);
        }),
      );
    },
    barrierDismissible: barrierDismissible,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black87,
    // 自定义遮罩颜色
    transitionDuration: const Duration(milliseconds: 150),
    transitionBuilder: _buildMaterialDialogTransitions,
  );
}

// 动画
Widget _buildMaterialDialogTransitions(
    BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
  // 使用缩放动画
  return ScaleTransition(
    scale: CurvedAnimation(
      parent: animation,
      curve: Curves.easeOut,
    ),
    child: child,
  );
}
