import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoggedIn = false;
  String _firstName = '';
  String _lastName = '';
  String _email = '';

  bool get isLoggedIn => _isLoggedIn;
  String get fullName => '$_firstName $_lastName';
  String get email => _email;

  void loginDummy() {
    _firstName = 'John';
    _lastName = 'Doe';
    _email = 'john.doe@gmail.com';
    _isLoggedIn = true;
    notifyListeners();
  }

  void logout() {
    _isLoggedIn = false;
    _firstName = '';
    _lastName = '';
    _email = '';
    notifyListeners();
  }
}
