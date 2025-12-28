// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clipboard.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(clipboardService)
const clipboardServiceProvider = ClipboardServiceProvider._();

final class ClipboardServiceProvider
    extends
        $FunctionalProvider<
          ClipboardService,
          ClipboardService,
          ClipboardService
        >
    with $Provider<ClipboardService> {
  const ClipboardServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'clipboardServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$clipboardServiceHash();

  @$internal
  @override
  $ProviderElement<ClipboardService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ClipboardService create(Ref ref) {
    return clipboardService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ClipboardService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ClipboardService>(value),
    );
  }
}

String _$clipboardServiceHash() => r'88ba26e5832ecede983c9054b3e4ae654f8f5882';
