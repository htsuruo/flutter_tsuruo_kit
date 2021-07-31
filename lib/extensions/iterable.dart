extension ItarableX<T extends Object> on Iterable<T?> {
  Iterable<T> whereNotNull() => whereType<T>();
}
