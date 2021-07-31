import 'package:rxdart/rxdart.dart';

extension StreamX<T extends Object> on Stream<T?> {
  Stream<T> whereNotNull() => whereType<T>();
}
