import 'package:flutter/material.dart';
import 'package:tsuruo_kit/tsuruo_kit.dart';

class BarrierDialog extends StatelessWidget {
  const BarrierDialog({
    Key? key,
    required this.show,
    required this.title,
    required this.child,
    this.content,
    this.actions,
    this.backgroundColor,
  }) : super(key: key);

  final bool show;
  final Widget title;
  final Widget? content;
  final Widget child;
  final List<Widget>? actions;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Barrier(
      show: show,
      backgroundColor: backgroundColor,
      boxWidget: SafeArea(
        child: AlertDialog(
          title: title,
          scrollable: true,
          content: content,
          actions: actions,
        ),
      ),
      child: child,
    );
  }
}
