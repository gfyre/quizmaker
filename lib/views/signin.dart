import 'package:flutter/material.dart';
import '../widgets/widgets.dart';
import 'signup.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  String email, password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context),
        backgroundColor: Colors.transparent,
        elevation: 0,
        brightness: Brightness.light,
      ),
      body: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Spacer(),
              TextFormField(
                validator: (value) {
                  return value.isEmpty ? "Enter a valid email" : null;
                },
                decoration: InputDecoration(
                  hintText: "Email",
                ),
                onChanged: (value) {
                  email = value;
                },
              ),
              SizedBox(
                height: 6,
              ),
              TextFormField(
                validator: (value) {
                  return value.isEmpty ? "Enter a valid password" : null;
                },
                decoration: InputDecoration(
                  hintText: "Password",
                ),
                onChanged: (value) {
                  password = value;
                },
              ),
              SizedBox(
                height: 24,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 18),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(30),
                ),
                width: MediaQuery.of(context).size.width - 48,
                alignment: Alignment.center,
                child: Text(
                  "Sign in",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUp(),
                        ),
                      );
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          fontSize: 16, decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}