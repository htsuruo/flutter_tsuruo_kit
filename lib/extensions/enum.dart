import 'package:flutter/foundation.dart';

extension EnumX on Enum {
  String get described => describeEnum(this);
}

extension EnumsX<T extends Enum> on List<T> {
  T from(String value) => firstWhere(
        (e) => '$e'.split('.').last == value,
        orElse: () => throw AssertionError('Enum $T has not $value'),
      );
}
