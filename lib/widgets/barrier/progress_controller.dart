import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';

final ChangeNotifierProvider<ProgressController> progressController =
    ChangeNotifierProvider(
  (ref) => ProgressController(),
);

// Controllerの参照回数が多く`notifier`をつけるのが煩わしいので
// StateNotifierではなくChangeNotifierとした
class ProgressController extends ChangeNotifier {
  bool _show = false;
  bool get show => _show;

  Future<T> executeWithProgress<T>(Future<T> Function() f) async {
    try {
      _show = true;
      notifyListeners();
      return await f();
    } finally {
      _show = false;
      notifyListeners();
    }
  }
}
