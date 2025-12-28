import 'package:flutter/material.dart';

import 'progress_barrier.dart';

class BarrierDialog extends StatelessWidget {
  const BarrierDialog({
    super.key,
    required this.show,
    required this.title,
    required this.child,
    this.content,
    this.actions,
    this.backgroundColor,
  });

  final bool show;
  final Widget title;
  final Widget? content;
  final Widget child;
  final List<Widget>? actions;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ProgressBarrier(
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
