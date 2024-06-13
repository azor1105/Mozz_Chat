import 'dart:math';

import 'package:chat/src/core/constants/collection_keys.dart';
import 'package:chat/src/core/extensions/random_in_range.dart';
import 'package:chat/src/core/theme/app_colors.dart';
import 'package:chat/src/data/models/user/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthRepository {
  AuthRepository({required FirebaseFirestore fireStore})
      : _fireStore = fireStore;

  final FirebaseFirestore _fireStore;
  final Random _random = Random();

  // Stream<List<SchoolSubjectModel>> getSchoolSubjects() {
  //   return _fireStore.collection('school_subjects').snapshots().map(
  //         (event) => event.docs
  //             .map((doc) => SchoolSubjectModel.fromJson(doc.data()))
  //             .toList(),
  //       );
  // }

  Future<UserModel?> getUserByLogin(String login) async {
    var data = await _fireStore
        .collection(CollectionKeys.USERS)
        .where('login', isEqualTo: login)
        .get();

    print("IS EMPTY: ${data.docs.isEmpty}");
    return data.docs.isEmpty
        ? null
        : UserModel.fromJson(
            data.docs.first.data(),
          );
  }

  Future<UserModel> register({
    required String login,
    required String password,
  }) async {
    var colors = AppColors.userColors;
    UserModel user = UserModel(
      id: 'LATER',
      login: login,
      color: colors[_random.intInRange(0, colors.length)].value,
      isOnline: true,
      password: password,
    );
    var newUser = await _fireStore.collection(CollectionKeys.USERS).add(
          user.toJson(),
        );
    // Setting id of user
    await _fireStore.collection(CollectionKeys.USERS).doc(newUser.id).update(
      {"id": newUser.id},
    );
    return user.copyWith(id: newUser.id);
  }
}
