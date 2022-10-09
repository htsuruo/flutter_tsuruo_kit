import 'package:example/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tsuruo_kit/tsuruo_kit.dart';

class ProgressPage extends ConsumerWidget {
  const ProgressPage({super.key});

  static const routeName = '/progress';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final useCustomIndicator = ref.watch(_useCustomIndicator);
    return ProgressHUD(
      indicatorWidget: useCustomIndicator
          ? LoadingAnimationWidget.fourRotatingDots(
              color: colorScheme.primary,
              size: 44,
            )
          : null,
      child: Scaffold(
        appBar: AppBar(
          title: Text(runtimeType.toString()),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              OutlinedButton(
                onPressed: () async {
                  await ref.read(_progressController).show();
                },
                child: const Text('show'),
              ),
              CheckboxListTile(
                value: useCustomIndicator,
                onChanged: (_) {
                  ref
                      .read(_useCustomIndicator.notifier)
                      .update((state) => !state);
                },
                title: const Text('Use custom progress indicator'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final _useCustomIndicator = StateProvider((ref) => false);
final _progressController = Provider(_ProgressController.new);

class _ProgressController {
  _ProgressController(this._ref);
  final Ref _ref;

  Future<void> show() async {
    final success =
        await _ref.read(progressController.notifier).executeWithProgress<bool>(
              () => Future<bool>.delayed(const Duration(seconds: 2), () {
                return true;
              }),
            );
    logger.fine('success: $success');
    // 結果を元に連続して呼び出すことも可能
    // if (success) {
    //   await Future<void>.delayed(const Duration(seconds: 1));
    //   await _read(progressController.notifier).executeWithProgress<bool>(
    //     () => Future.delayed(const Duration(seconds: 3), () {
    //       return true;
    //     }),
    //   );
    // }
  }
}
