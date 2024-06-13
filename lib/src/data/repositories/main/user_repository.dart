import 'package:chat/src/core/constants/collection_keys.dart';
import 'package:chat/src/data/models/user/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository {
  UserRepository({required FirebaseFirestore firestore})
      : _firestore = firestore;
  final FirebaseFirestore _firestore;

  // Future<void> updateUser({
  //   required bool isOnline,
  //   required String userId,
  // }) async {
  //   await _firestore
  //       .collection(CollectionKeys.USERS)
  //       .doc(userId)
  //       .update({'is_online': isOnline});
  // }

  Stream<List<UserModel>> getUsers() {
    return _firestore
        .collection(CollectionKeys.USERS)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map(
              (doc) => UserModel.fromJson(doc.data()),
            )
            .toList());
  }

  Stream<List<UserModel>> getUsersBySearch({required String enteredLogin}) {
    return _firestore
        .collection(CollectionKeys.USERS)
        .where('login', isEqualTo: enteredLogin)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map(
              (doc) => UserModel.fromJson(doc.data()),
            )
            .toList());
  }
}
