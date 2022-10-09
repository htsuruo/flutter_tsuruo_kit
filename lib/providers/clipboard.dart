import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tsuruo_kit/providers/scaffold_messenger.dart';

final clipboardProvider = Provider(ClipboardService.new);

class ClipboardService {
  ClipboardService(this._ref);
  final Ref _ref;

  void copy(
    String text, {
    String? message,
  }) {
    Clipboard.setData(ClipboardData(text: text));
    _ref.read(scaffoldMessengerKey).currentState!.showMessage(
          message ?? 'copied successfully',
        );
  }
}
