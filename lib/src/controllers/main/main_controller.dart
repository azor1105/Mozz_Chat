import 'dart:async';
import 'package:chat/src/base/base_controller.dart';
import 'package:chat/src/data/models/user/user_model.dart';
import 'package:chat/src/data/repositories/main/user_repository.dart';
import 'package:flutter/material.dart';

class MainController extends BaseController {
  MainController({required UserRepository userRepository})
      : _userRepository = userRepository;
  final UserRepository _userRepository;
  late StreamSubscription _streamSubscription;
  List<UserModel> users = [];

  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocus = FocusNode();

  @override
  void onInit() {
    getUsers();
    super.onInit();
  }

  void getUsers() {
    _streamSubscription = _userRepository.getUsers().listen(
      (event) {
        event.removeWhere((user) => user.id == getUser!.id);
        users = event;
        update();
      },
    );
  }

  void onSearch(String query) async {
    if (query.isEmpty) {
      getUsers();
    } else {
      await Future.delayed(const Duration(milliseconds: 150));
      _userRepository.getUsersBySearch(query: query).listen(
        (event) {
          event.removeWhere((user) => user.id == getUser!.id);
          users = event;
          update();
        },
      );
    }
  }

  void clearSearch() {
    if (searchController.text.isNotEmpty) {
      searchController.clear();
      getUsers();
      searchFocus.unfocus();
    }
  }

  @override
  void onClose() {
    searchFocus.dispose();
    searchController.dispose();
    _streamSubscription.cancel();
    super.onClose();
  }
}
