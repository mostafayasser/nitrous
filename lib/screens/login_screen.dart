import 'package:flutter/material.dart';
import '../models/screens_models/login_screen_model.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.cyan[50],
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight -
                            MediaQuery.of(context).size.height * 0.08,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            "assets/images/logo.png",
                            fit: BoxFit.cover,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "hello!",
                                style: TextStyle(fontSize: 30),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: TextField(
                                  controller: LoginScreenModel.email,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 10),
                                    suffixIcon: Icon(Icons.person),
                                    hintText: "Username",
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.indigoAccent),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: TextField(
                                  controller: LoginScreenModel.password,
                                  obscureText: true,
                                  obscuringCharacter: "*",
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 10),
                                    suffixIcon: Icon(Icons.person),
                                    hintText: "Password",
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.indigoAccent),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                ),
                              ),
                              FlatButton(
                                  onPressed: () {},
                                  child: Text("Create new account"))
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.08,
                      child: RaisedButton(
                        onPressed: () => LoginScreenModel.login(context),
                        child: Text("Continue"),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
