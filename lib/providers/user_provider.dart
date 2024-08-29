
import 'package:flutter/material.dart';
import 'package:ngo/models/user.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
    id: '',
    name: '',
    email: '',
    password: '',
    address: '',
    type: '',
    token: '',
    
  );

  User get user => _user;

  void setUser(String? userData) {
    if (userData != null) {
      try {
        _user = User.fromJson(userData);
        notifyListeners();
      } catch (e) {
        print('Error parsing user data: $e');
      }
    } else {
      print('User data is null');
    }
  }

  void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }
}