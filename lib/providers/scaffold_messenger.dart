import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final scaffoldMessengerKey = Provider(
  (_) => GlobalKey<ScaffoldMessengerState>(),
);

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
