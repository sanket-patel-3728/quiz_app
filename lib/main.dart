import 'package:flutter/material.dart';
import 'package:quiz_app/helper/function.dart';
import 'package:quiz_app/views/Home.dart';
import 'package:quiz_app/views/signIn.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLoggedIn = false;

  @override
  void initState() {
    checkUserLoggedIn();
    super.initState();
  }

  checkUserLoggedIn() async {
    await HelperFunction.getUserLoggedIn().then((value) {
      setState(() {
        _isLoggedIn = value;
      });
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QUIZ APP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: (_isLoggedIn ?? false) ? Home() : SignIn(),
    );
  }
}
