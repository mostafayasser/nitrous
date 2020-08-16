import 'package:flutter/material.dart';

import '../models/screens_models/signup_screen_model.dart';
import '../models/screens_models/login_screen_model.dart';
import 'package:nitrous/screens/login_screen.dart';
import 'package:nitrous/screens/signup_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final loginModel = LoginScreenModel();
  final signupModel = SignUpScreenModel();
  bool loading = false;
  bool login = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background_cropped.png"),
                fit: BoxFit.cover)),
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05),
            width: MediaQuery.of(context).size.width * 0.8,
            height: login
                ? MediaQuery.of(context).size.height * 0.6
                : MediaQuery.of(context).size.height * 0.8,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 0),
                      blurRadius: 3)
                ]),
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: login
                      ? MediaQuery.of(context).size.height * 0.6
                      : MediaQuery.of(context).size.height * 0.8,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset("assets/images/logo.png",
                        height: MediaQuery.of(context).size.height * 0.2,
                        fit: BoxFit.cover),
                    login
                        ? LoginScreen(
                            model: loginModel,
                          )
                        : SignupScreen(
                            model: signupModel,
                          ),
                    login
                        ? FlatButton(
                            onPressed: () {
                              setState(() {
                                login = false;
                              });
                            },
                            child: Text("Need an account? Register"))
                        : FlatButton(
                            onPressed: () {
                              setState(() {
                                login = true;
                              });
                            },
                            child: Text("Already have an account? Login")),
                    !loading
                        ? login
                            ? Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  color: Colors.blue[400],
                                  onPressed: () {
                                    setState(() {
                                      loading = true;
                                      print("loading");
                                    });
                                    loginModel.login(context);
                                    setState(() {
                                      loading = false;
                                      print("not");
                                    });
                                  },
                                  child: Text(
                                    "Login",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              )
                            : Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                child: RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  color: Colors.blue[400],
                                  onPressed: () => signupModel.signup(context),
                                  child: Text(
                                    "Register",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              )
                        : CircularProgressIndicator(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
