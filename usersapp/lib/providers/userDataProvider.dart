import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:usersapp/models/userModel.dart';
import 'package:usersapp/services/api.dart';

class UserDataProvider extends ChangeNotifier {
  List<UserModel> _allUsers = [];
  List<UserModel> get allUsers => _allUsers;

  Future<void> fetchAllUsers() async {
    try {
      var response = await Apis().fetchUsers();

      if (response.statusCode == 200) {
        var userItems = json.decode(response.body);
        _allUsers = List<UserModel>.from(
            userItems.map((image) => UserModel.fromJson(image)));
        notifyListeners();
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error during API request: $e');
    }
  }
}
