import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nitrous/helpers/routes.dart';

import '../models/auth.dart';

class SignUpScreenModel {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController jobTitle = TextEditingController();
  final _fireStore = Firestore.instance;

  void signup(context) async {
    final done = await Auth.signup(
        email: email.text, password: password.text, context: context);
    if (done) {
      await _fireStore
          .collection("Nitrous")
          .document("Users")
          .collection("Users")
          .document(email.text)
          .setData({
        "email": email.text,
        "userName": userName.text,
        "jobTitle": jobTitle.text,
        "imgUrl": ""
      });
      Navigator.of(context).pushReplacementNamed(Routes.homeScreen);
    }
  }
}
