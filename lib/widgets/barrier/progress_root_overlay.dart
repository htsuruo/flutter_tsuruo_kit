import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tsuruo_kit/widgets/barrier/progress_provider.dart';

import 'progress_barrier.dart';

class ProgressRootOverlay extends ConsumerWidget {
  const ProgressRootOverlay({
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
    final isProgress = ref.watch(progressProvider);
    return ProgressBarrier(
      show: isProgress,
      label: label,
      useBoxIndicator: useBoxIndicator,
      boxWidget: indicatorWidget,
      child: child,
    );
  }
}
