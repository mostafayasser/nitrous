import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Auth {
  static FirebaseAuth _auth = FirebaseAuth.instance;
  static bool loggedIn = false;
  static Future<bool> signup({email, password, context}) async {
    bool _signedUp = true;
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on PlatformException catch (e) {
      _signedUp = false;
      alertDialog(context, e.message);
    } on Exception catch (e) {
      _signedUp = false;
      alertDialog(context, e);
    }
    return _signedUp;
  }

  static Future<bool> login({email, password, context}) async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        if (value.user.email != null) {
          loggedIn = true;
        }
      });
    } on PlatformException catch (e) {
      alertDialog(context, e.message);
    } on Exception catch (e) {
      alertDialog(context, e);
    }
    return loggedIn;
  }

  static signOut() {
    _auth.signOut();
  }

  static alertDialog(BuildContext context, message) {
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
