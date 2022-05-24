import 'package:flutter/material.dart';

class UnfocusOnTap extends StatelessWidget {
  const UnfocusOnTap({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // default:`HitTestBehavior`だとPadding領域はタップ対象とならないため`opaque`指定
      // ref. https://api.flutter.dev/flutter/rendering/HitTestBehavior-class.html
      behavior: HitTestBehavior.opaque,
      // 画面タップでキーボードなどを閉じる
      onTap: () => FocusScope.of(context).unfocus(),
      child: child,
    );
  }
}
