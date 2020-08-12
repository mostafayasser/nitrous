import 'package:flutter/material.dart';

import '../models/auth.dart';

class LoginScreenModel {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void login(context) async {
    await Auth.login(
        email: email.text, password: password.text, context: context);
  }
}
