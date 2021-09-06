import 'package:example/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_logger/simple_logger.dart';

import 'app.dart';

void main() {
  logger.setLevel(Level.FINE, includeCallerInfo: true);
  return runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
