import 'package:flutter/material.dart';
import 'package:nitrous/helpers/routes.dart';

import '../models/auth.dart';

class LoginScreenModel {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void login(context) async {
    bool loggedIn = await Auth.login(
        email: email.text, password: password.text, context: context);
    if (loggedIn) {
      Navigator.of(context).pushReplacementNamed(Routes.homeScreen);
    }
  }
}
