// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scaffold_messenger.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(scaffoldMessengerKey)
const scaffoldMessengerKeyProvider = ScaffoldMessengerKeyProvider._();

final class ScaffoldMessengerKeyProvider
    extends
        $FunctionalProvider<
          GlobalKey<ScaffoldMessengerState>,
          GlobalKey<ScaffoldMessengerState>,
          GlobalKey<ScaffoldMessengerState>
        >
    with $Provider<GlobalKey<ScaffoldMessengerState>> {
  const ScaffoldMessengerKeyProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'scaffoldMessengerKeyProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$scaffoldMessengerKeyHash();

  @$internal
  @override
  $ProviderElement<GlobalKey<ScaffoldMessengerState>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GlobalKey<ScaffoldMessengerState> create(Ref ref) {
    return scaffoldMessengerKey(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GlobalKey<ScaffoldMessengerState> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GlobalKey<ScaffoldMessengerState>>(
        value,
      ),
    );
  }
}

String _$scaffoldMessengerKeyHash() =>
    r'cc3edc81a568ef464e4bad0948974723fc28534c';
