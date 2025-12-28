import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'progress_provider.g.dart';

@Riverpod(keepAlive: true)
class ProgressNotifier extends _$ProgressNotifier {
  @override
  bool build() => false;

  Future<T> runWithProgress<T>(Future<T> Function() f) async {
    try {
      state = true;
      return await f();
    } finally {
      state = false;
    }
  }
}
