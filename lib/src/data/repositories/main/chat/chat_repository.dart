import 'package:cloud_firestore/cloud_firestore.dart';

class ChatRepository {
  ChatRepository({required FirebaseFirestore firestrore})
      : _firestore = firestrore;
  final FirebaseFirestore _firestore;
}
