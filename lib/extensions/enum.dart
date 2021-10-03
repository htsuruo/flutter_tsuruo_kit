import 'package:flutter/foundation.dart';

// Dart 2.15で`name``byName`が言語レベルで入ってくるのでこれらExtensionは不要となる
// 先んじて命名を揃えておく
// ref. https://github.com/dart-lang/sdk/blob/dev/sdk/lib/core/enum.dart
extension EnumX on Enum {
  String get name => describeEnum(this);
}

extension EnumsX<T extends Enum> on List<T> {
  T byName(String value) => firstWhere(
        (e) => '$e'.split('.').last == value,
        orElse: () => throw AssertionError('Enum $T has not $value'),
      );
}
