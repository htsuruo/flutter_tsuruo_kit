import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tsuruo_kit/providers/scaffold_messenger.dart';

final clipboardProvider = Provider((ref) => ClipboardService(ref.read));

class ClipboardService {
  ClipboardService(this._read);
  final Reader _read;

  void copy(
    String text, {
    String? message,
  }) {
    Clipboard.setData(ClipboardData(text: text));
    _read(scaffoldMessengerKey).currentState!.showMessage(
          message ?? 'copied successfully',
        );
  }
}
