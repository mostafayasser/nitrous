import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
      await _fireStore.collection("Users").document(email.text).setData({
        "email": email.text,
        "userName": userName.text,
        "jobTitle": jobTitle.text,
        "imgUrl": ""
      });
    }
  }
}
