import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Auth {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<void> signup({email, password, context}) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => print(value.user.email));
    } on PlatformException catch (e) {
      alertDialog(context, e.message);
    } on Exception catch (e) {
      alertDialog(context, e);
    }
  }

  static Future<void> login({email, password, context}) async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => print(value.user.email));
    } on PlatformException catch (e) {
      alertDialog(context, e.message);
    } on Exception catch (e) {
      alertDialog(context, e);
    }
  }

  static alertDialog(BuildContext context, message) {
    // This is the ok button
    // show the alert dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Error occured"),
          content: Text(message),
          actions: [
            FlatButton(
              child: Text("Ok"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
          elevation: 5,
        );
      },
    );
  }
}
