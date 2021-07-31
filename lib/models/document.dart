import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

// ref. https://github.com/mono0926/flutter_firestore_ref/blob/master/lib/src/document.dart

// entityと自身のDocumentReferenceがほしい時に使う
@immutable
class Document<E> {
  const Document(this.ref, this.entity);
  final DocumentReference<E> ref;
  final E entity;

  String get id => ref.id;
  String get path => ref.path;

  Document<E> copyWith(E entity) {
    return Document<E>(
      ref,
      entity ?? this.entity,
    );
  }
}
