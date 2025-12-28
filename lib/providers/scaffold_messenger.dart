import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'scaffold_messenger.g.dart';

@riverpod
GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey(Ref ref) =>
    GlobalKey<ScaffoldMessengerState>();

extension ScaffoldMessengerStateEx on ScaffoldMessengerState {
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showMessage(
    String message,
  ) {
    removeCurrentSnackBar();
    return showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
