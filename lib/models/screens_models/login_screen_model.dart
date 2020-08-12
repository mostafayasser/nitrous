import 'package:flutter/material.dart';

import '../models/auth.dart';

class LoginScreenModel {
  static TextEditingController email = TextEditingController();
  static TextEditingController password = TextEditingController();

  static void login(context) async {
    await Auth.signup(
        email: email.text, password: password.text, context: context);
    await Auth.login(
        email: email.text, password: password.text, context: context);
  }
}
