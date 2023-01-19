import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';

extension StateNotifierEx<T> on StateNotifier<T> {
  Stream<T> get streamWithCurrent =>
      // ignore: invalid_use_of_protected_member
      Rx.concatEager([Stream.value(state), stream]);
}
