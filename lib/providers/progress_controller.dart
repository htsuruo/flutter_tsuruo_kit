import 'package:flutter_riverpod/flutter_riverpod.dart';

final progressController = StateNotifierProvider<ProgressController, bool>(
  (ref) => ProgressController(),
);

class ProgressController extends StateNotifier<bool> {
  ProgressController() : super(false);
  Future<T> executeWithProgress<T>(Future<T> Function() f) async {
    try {
      state = true;
      return await f();
    } finally {
      state = false;
    }
  }
}
