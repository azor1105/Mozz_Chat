import 'package:chat/src/core/constants/collection_keys.dart';
import 'package:chat/src/data/models/message/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatRepository {
  ChatRepository({required FirebaseFirestore firestrore})
      : _firestore = firestrore;
  final FirebaseFirestore _firestore;

  Future<void> addMessage({required MessageModel message}) async {
    var addedMessage = await _firestore.collection(CollectionKeys.MESSAGES).add(
          message.toJson(),
        );
    // Setting id of user
    await _firestore
        .collection(CollectionKeys.MESSAGES)
        .doc(addedMessage.id)
        .update(
      {"id": addedMessage.id},
    );
  }

  Stream<List<MessageModel>> getMessages({
    required String from,
    required String to,
  }) {
    return _firestore
        .collection(CollectionKeys.MESSAGES)
        .where('address', whereIn: ['$from|$to', '$to|$from'])
        .orderBy('date_time')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map(
              (doc) => MessageModel.fromJson(doc.data()),
            )
            .toList());
  }
}
