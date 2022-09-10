import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

enum CollectionName {
  Event,
}

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
