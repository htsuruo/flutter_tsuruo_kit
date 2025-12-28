// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProgressNotifier)
const progressProvider = ProgressNotifierProvider._();

final class ProgressNotifierProvider
    extends $NotifierProvider<ProgressNotifier, bool> {
  const ProgressNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'progressProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$progressNotifierHash();

  @$internal
  @override
  ProgressNotifier create() => ProgressNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$progressNotifierHash() => r'594c104d9676d837fc98f88907e210076bc54acf';

abstract class _$ProgressNotifier extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
