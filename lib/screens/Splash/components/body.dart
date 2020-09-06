
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginsignupwithrestapi/screens/Home/home_screen.dart';
import 'package:loginsignupwithrestapi/screens/Login/login_screen.dart';
import 'package:loginsignupwithrestapi/screens/Splash/components/background.dart';
import 'package:loginsignupwithrestapi/screens/Welcome/welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body>
{
  var status;
  @override
  void initState() {
    stratTimer();
  }

  void stratTimer(){
     Timer(Duration(seconds: 3), () {
      navigateUser(); //It will redirect  after 3 seconds
    });

  }

  Future<void> navigateUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var status = prefs.getBool('isLoggedIn') ?? false;
    print(status);
 if(status)
   {
     Navigator.push(context, MaterialPageRoute(builder:(context){
       return HomeScreen() ;
     }
     )
     );
   }
 else{
   Navigator.push(context, MaterialPageRoute(builder:(context){
     return WelcomeScreen();
   }
   )
   );
 }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
               Image.asset(
        "assets/images/logo.png",
        height: size.height * 0.35,
               )
        ],
      )
    )
      );

  }

}