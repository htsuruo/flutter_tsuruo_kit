extension ObjectX<T extends Object> on T? {
  // ex1. foo.applyUnlessNull(Text.new)
  V? applyUnlessNull<V>(V Function(T v) func) {
    return this == null ? null : func(this!);
  }
}
