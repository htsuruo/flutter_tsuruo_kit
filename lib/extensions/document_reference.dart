import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tsuruo_kit/tsuruo_kit.dart';

extension DocumentReferenceX<E> on DocumentReference<E> {
  // `withConverter`されたDocumentReferenceを元のDocumentReferenceに戻す
  // `withConverter`で型をつけるとruntimeTypeは`_WithConverterDocumentReference`となり
  // クエリで扱う`_JsonDocumentReference`ではなくなるため、クエリ判定でできなくなる
  // whereクエリを利用する場合は一度元のDocumentReference（`_JsonDocumentReference`）に戻す必要がある
  // ref. https://github.com/39works/mytradeApp/pull/239#issuecomment-840568544
  DocumentReference<JsonMap> get raw => FirebaseFirestore.instance.doc(path);
}
