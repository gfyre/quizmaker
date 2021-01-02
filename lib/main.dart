import 'package:flutter/material.dart';

import './views/signin.dart';
import './views/home.dart';
import './helper/functions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLoggedIn = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkUserLoggedInStatus();
  }

  checkUserLoggedInStatus() async {
    HelperFunctions.getUserLoginDetails().then((value) {
      setState(() {
        _isLoggedIn = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: (_isLoggedIn ?? false) ? HomePage() : SignIn(),
    );
  }
}
