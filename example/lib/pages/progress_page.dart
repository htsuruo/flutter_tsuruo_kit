import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tsuruo_kit/tsuruo_kit.dart';

class ProgressPage extends ConsumerWidget {
  const ProgressPage({Key? key}) : super(key: key);

  static const routeName = '/progress';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProgressHUD(
      child: Scaffold(
        appBar: AppBar(
          title: Text(runtimeType.toString()),
        ),
        body: Center(
          child: OutlinedButton(
            onPressed: () async {
              await ref.read(_progressController).show();
            },
            child: const Text('show'),
          ),
        ),
      ),
    );
  }
}

final _progressController = Provider((ref) => _ProgressController(ref.read));

class _ProgressController {
  _ProgressController(this._read);
  final Reader _read;

  Future<void> show() async {
    final success =
        await _read(progressController.notifier).executeWithProgress<bool>(
      () => Future<bool>.delayed(const Duration(seconds: 3), () {
        return true;
      }),
    );
    // 結果を元に連続して呼び出すことも可能
    if (success) {
      await Future<void>.delayed(const Duration(seconds: 1));
      await _read(progressController.notifier).executeWithProgress<bool>(
        () => Future.delayed(const Duration(seconds: 3), () {
          return true;
        }),
      );
    }
  }
}
