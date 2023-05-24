import 'package:cloud_firestore/cloud_firestore.dart';

extension DocumentReferenceX<E> on DocumentReference<E> {
  // `withConverter`されたDocumentReferenceを元のDocumentReferenceに戻す
  // `withConverter`で型をつけるとruntimeTypeは`_WithConverterDocumentReference`となり
  // クエリで扱う`_JsonDocumentReference`ではなくなるため、クエリ判定でできなくなる
  // whereクエリを利用する場合は一度元のDocumentReference（`_JsonDocumentReference`）に戻す必要がある
  DocumentReference<Map<String, dynamic>> get raw =>
      FirebaseFirestore.instance.doc(path);
}
