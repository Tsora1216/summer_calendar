import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum CollectionName {
  Event,
}

final storeProvider = Provider<FirestoreConfig>((context) => FirestoreConfig());

class FirestoreConfig {
  final _firestore = FirebaseFirestore.instance;

  ///クリエイト
  Future<void> setData({
    required CollectionName collection,
    required Map<String, dynamic> payload,
    String documentId = "",
  }) async {
    final _db = _firestore.collection(collection.name);
    // ref
    if (documentId.isEmpty) {
      documentId = const Uuid().v4();
    }
    final DocumentReference ref = _db.doc(documentId);
    payload['id'] = documentId;
    payload['updatedAt'] = DateTime.now();
    payload['createdAt'] = DateTime.now();

    try {
      await ref.set(payload);
    } catch (e) {
      rethrow;
    }
  }
}
