
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginsignupwithrestapi/components/rounded_button.dart';
import 'package:loginsignupwithrestapi/screens/Home/components/background.dart';
import 'package:loginsignupwithrestapi/screens/Welcome/welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatelessWidget{
  SharedPreferences sharedPreferences;
  @override
  Widget build(BuildContext context) {
    return Background(child: SingleChildScrollView(
      child: Container(
        child:Column(
          children: [

            Text(
              '" Take up one idea. Make that one idea your life--think of it, dream of it, '
                  'live on that idea. Let the brain, muscles, nerves, every part of your body, be full of that idea, '
                  'and just leave every other idea alone. This is the way to success."',
              style: TextStyle( fontFamily: 'Pacifico',fontSize: 20.0, color: Colors.purple),
            ),
            RoundedButton(
              text: "LogOut",
              press: () {
                logOut(context);
              },
            ),
          ],
        ),
      ) ,
    ));
  }
void logOut(BuildContext context) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.clear();
  Navigator.push(context, MaterialPageRoute(builder:(context){
    return WelcomeScreen();
  }));
}

}