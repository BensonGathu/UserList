import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:usersapp/models/userModel.dart';
import 'package:usersapp/services/api.dart';

class UserDataProvider extends ChangeNotifier {
  List<UserModel> _allUsers = [];
  List<UserModel> get allUsers => _allUsers;
  bool _isDataLoaded = false; 

  bool get isDataLoaded => _isDataLoaded; 

  Future<void> fetchAllUsers() async {
    try {
      var response = await Apis().fetchUsers();

      if (response.statusCode == 200) {
        var userItems = json.decode(response.body);
        _allUsers = List<UserModel>.from(
            userItems.map((image) => UserModel.fromJson(image)));
        _isDataLoaded = true; 
        notifyListeners();
      } else {
        // Handle error here, such as displaying an error message or logging.
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      // Handle exceptions that may occur during the API request.
      print('Error during API request: $e');
    }
  }
}
