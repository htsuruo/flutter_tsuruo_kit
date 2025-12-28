import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tsuruo_kit/providers/scaffold_messenger.dart';

part 'clipboard.g.dart';

@riverpod
ClipboardService clipboardService(Ref ref) => ClipboardService(ref);

class ClipboardService {
  ClipboardService(this._ref);
  final Ref _ref;

  void copy(
    String text, {
    String? message,
  }) {
    Clipboard.setData(ClipboardData(text: text));
    _ref
        .read(scaffoldMessengerKeyProvider)
        .currentState!
        .showMessage(
          message ?? 'copied successfully',
        );
  }
}
