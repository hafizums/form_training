import 'package:flutter/material.dart';

class Login {
  String username;
  String password;

  Login({required this.username, required this.password});
}

class LoginProvider extends ChangeNotifier {
  late Login loginData;

  void logUserIn(Login login) {
    loginData = login;
    notifyListeners();
  }
}
