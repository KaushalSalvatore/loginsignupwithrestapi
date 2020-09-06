import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginsignupwithrestapi/screens/Login/components/body.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = "/login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}