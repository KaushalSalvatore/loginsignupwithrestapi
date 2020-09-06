


import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loginsignupwithrestapi/components/already_have_an_account_acheck.dart';
import 'package:loginsignupwithrestapi/components/rounded_button.dart';
import 'package:loginsignupwithrestapi/components/rounded_input_field.dart';
import 'package:loginsignupwithrestapi/components/rounded_password_field.dart';
import 'package:loginsignupwithrestapi/screens/Home/home_screen.dart';
import 'package:loginsignupwithrestapi/screens/Signup/signup_screen.dart';
import 'package:loginsignupwithrestapi/utils/api_constaints.dart';
import 'package:loginsignupwithrestapi/utils/constants.dart';
import 'package:loginsignupwithrestapi/utils/string_constaints.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'background.dart';

class Body extends StatelessWidget {
  String email='';
  String password ='';
  bool _isloading = false;
  SharedPreferences _preferences;
  void logInRequest(BuildContext context,String email , pass) async
  {
    _preferences = await SharedPreferences.getInstance();
    var map =new Map<String , dynamic>();
    map['email'] = email;
    map['password'] = pass;
    http.Response response = await http.post('http://192.168.43.124:8000/api/auth/login',
      headers:{
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded"
      },
      body: map,);
    if(response.statusCode == 200)
    {
      Map<String , dynamic> jsonResopnse = json.decode(response.body);
      if(jsonResopnse!= null ){
        var data = jsonResopnse['user'];
        var  token = data['access_token'] ;
        _preferences.setString("token", token);
        _preferences?.setBool("isLoggedIn", true);
      }
      successToast(context, 'Login Succesfull');
      Navigator.push(context, MaterialPageRoute(builder:(context){
        return HomeScreen();
      }
      )
    );
    }
    else{
      errorToast(context, "Somthing Went Wrong");
    }
    if(response.statusCode == 401)
      {
        errorToast(context, "Invalid Email Password");
      }
  }


  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent));
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              StringConstaints.LOGIN,
              style: TextStyle(fontFamily: 'Pacifico',fontSize: 30.0, color: Colors.purple),
            ),
            SizedBox(height: size.height * 0.03),
            Image.asset(
              "assets/images/logo.png",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Email",
              onChanged: (value) {
                  email = value;
              },
            ),
            RoundedPasswordField(
              hintText: "Password",
              onChanged: (value) {
                password = value;
              },
            ),
            RoundedButton(
              text: StringConstaints.LOGIN,
              press: () {
                 if(email.isEmpty){errorToast(context,StringConstaints.ERROREMAIL);}
                 else if(password.isEmpty){errorToast(context,StringConstaints.ERRORPASSWORD);}
                // else if(!regex.hasMatch(name)){errorToast(context,StringConstaints.VALIDNAME);}
                else{
                   logInRequest(context,email,password);
                }

              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }


}
