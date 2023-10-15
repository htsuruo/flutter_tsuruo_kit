extension ObjectX<T extends Object> on T? {
  // before: foo == null ? null : Text(foo)
  // after: foo.applyUnlessNull(Text.new)
  V? applyOrNull<V>(V Function(T v) func) {
    return this == null ? null : func(this!);
  }
}
