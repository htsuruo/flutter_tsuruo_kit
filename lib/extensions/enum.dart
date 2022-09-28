extension EnumByNameX<T extends Enum> on Iterable<T> {
  // 該当のEnumが存在しない場合はnullを返す
  T? byNameOrNull(String? name) {
    try {
      if (name == null) {
        return null;
      }
      return byName(name);
      // ignore: avoid_catches_without_on_clauses
    } catch (_) {
      return null;
    }
  }

  T byNameOrDefault(String? name, {required T defaultValue}) =>
      byNameOrNull(name) ?? defaultValue;
}
