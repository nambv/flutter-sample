import 'dart:async';

import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  static String tag = "login_page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: LoginForm()),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  int _state = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget setUpButtonChild() {
      if (_state == 0) {
        return new Text(
          "LOGIN",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        );
      } else if (_state == 1) {
        return CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        );
      } else {
        return Icon(Icons.check, color: Colors.white);
      }
    }

    void animateButton() {
      setState(() {
        _state = 1;
      });

      Timer(Duration(milliseconds: 3300), () {
        setState(() {
          _state = 2;
        });
      });
    }

    loginHeader() => Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FlutterLogo(
              colors: Colors.green,
              size: 80.0,
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              "Welcome to Yeah1TV",
              style:
                  TextStyle(fontWeight: FontWeight.w700, color: Colors.green),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              "Sign in to continue",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        );

    loginFields() => Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              createEmailTextField(),
              createPasswordField(),
              SizedBox(height: 20.0),
              Container(
                padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
                width: double.infinity,
                child: RaisedButton(
                  padding: EdgeInsets.all(12.0),
                  shape: StadiumBorder(),
                  child: setUpButtonChild(),
                  color: Colors.green,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      setState(() {
                        if (_state == 0) {
                          animateButton();
                        }
                      });
                    }
                  },
                ),
              ),
              SizedBox(height: 12.0),
              Text(
                "SIGN UP FOR AN ACCOUNT",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        );

    loginBody() => SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[loginHeader(), loginFields()],
          ),
        );

    return Form(key: _formKey, child: loginBody());
  }
}

String validateEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value))
    return 'Enter Valid Email';
  else
    return null;
}

Widget createEmailTextField() {
  return Container(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
          child: TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Email cannot be empty';
              } else {
                return validateEmail(value);
              }
            },
            maxLines: 1,
            decoration: InputDecoration(
              hintText: "Enter your email",
              labelText: "Email",
            ),
          ),
        )
      ]));
}

Widget createPasswordField() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
    child: TextFormField(
      validator: (value) {
        if (value.isEmpty) {
          return 'Password cannot be empty';
        } else {
          if (value.length < 6) {
            return 'Password length must be at least 6 characters';
          }
        }
      },
      keyboardType: TextInputType.emailAddress,
      maxLines: 1,
      obscureText: true,
      decoration: InputDecoration(
        hintText: "Enter your password",
        labelText: "Password",
      ),
    ),
  );
}
