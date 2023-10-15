import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'barrier.dart';

// ProgressController依存の根本に置く用のWidget
// `executeWithProgress`に連動してBarrierが呼ばれる
class ProgressHUD extends ConsumerWidget {
  const ProgressHUD({
    super.key,
    required this.child,
    this.useBoxIndicator = true,
    this.label,
    this.indicatorWidget,
  });

  final Widget child;
  final bool useBoxIndicator;
  final String? label;
  final Widget? indicatorWidget;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final show = ref.watch(
      progressController.select((s) => s.show),
    );
    return Barrier(
      show: show,
      label: label,
      useBoxIndicator: useBoxIndicator,
      boxWidget: indicatorWidget,
      child: child,
    );
  }
}
