import 'package:flutter/material.dart';
import 'package:tsuruo_kit/tsuruo_kit.dart';

class BarrierDialog extends StatelessWidget {
  const BarrierDialog({
    Key? key,
    this.show = false,
    required this.title,
    required this.child,
    required this.content,
    this.actions,
    this.backgroundColor,
  }) : super(key: key);

  final Widget title;
  final Widget child;
  final Widget content;
  final List<Widget>? actions;
  final bool show;
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
