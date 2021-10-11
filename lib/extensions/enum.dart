import 'package:flutter/foundation.dart';

// Dart 2.15で`name``byName`が言語レベルで入ってくるのでこれらExtensionは不要となる
// 先んじて命名を揃えておく
// ref. https://github.com/dart-lang/sdk/blob/dev/sdk/lib/core/enum.dart
extension EnumX on Enum {
  String get name => describeEnum(this);
}

extension EnumsX<T extends Enum> on List<T> {
  T byName(String name) => firstWhere(
        (e) => '$e'.split('.').last == name,
        orElse: () => throw ArgumentError.value(
            name, 'name', 'No enum value with that name'),
      );

  // 該当のEnumが存在しない場合はnullを返す
  T? byNameOrNull(String? name) {
    try {
      return byName('$name');
      // ignore: avoid_catches_without_on_clauses
    } catch (_) {
      return null;
    }
  }
}