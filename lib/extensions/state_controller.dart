import 'package:flutter_riverpod/flutter_riverpod.dart';
// final selectedProductIdProvider = StateProvider<String?>((ref) => null);
// 上記のような`null`を初期値に持つ使い方が一般的であるがその場合どうしてもnullableになってしまう
// 本来参照時に`null`であることは想定されていないはずなのでエラーを返してあげるほうが親切
// アプリケーションコードレベルで`!`によるキャストで楽に対処するのも可能だが、
// `!`が意図しているものか不用意な`!`を判別するためにも極力表面的なコードでは`!`を使いたくない
// 故に`requireState`を経由して呼び出すことで表面的な`!`をなくしかつ`null`の際には気付けるようにする
// もちろんnon-nullableへのキャストなので実際にstateが`null`だった場合はリリースモードでもその処理が行われないので
// そうならないように開発段階で十分に潰しておく必要がある
// ref. https://github.com/39works/mytradeApp/pull/222#issuecomment-822199282

extension StateControllerEx<T> on StateController<T?> {
  T get requireState => state!;
}
