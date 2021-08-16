import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tsuruo_kit/tsuruo_kit.dart';

// ProgressController依存の根本に置く用のWidget
// `executeWithProgress`に連動してBarrierが呼ばれる
class ProgressHUD extends ConsumerWidget {
  const ProgressHUD({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final show = ref.watch(
      progressController.select((s) => s.show),
    );
    return Barrier(
      show: show,
      useBoxIndicator: true,
      child: child,
    );
  }
}
