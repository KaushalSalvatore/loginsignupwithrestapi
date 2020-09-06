import 'package:flutter/material.dart';
import 'package:loginsignupwithrestapi/screens/Splash/splash_screen.dart';
import 'package:loginsignupwithrestapi/utils/constants.dart';

void main() =>runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: SplashScreen(),
    );
  }

}