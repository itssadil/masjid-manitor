import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference myStore =
      FirebaseFirestore.instance.collection('uData');

  Future<void> addInfo(
    String uid,
    String name,
    String address,
  ) {
    return myStore.add(
      {
        "uid": uid,
        "name": name,
        "address": address,
        "timestamp": Timestamp.now(),
      },
    );
  }
}
