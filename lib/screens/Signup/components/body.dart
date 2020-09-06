import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loginsignupwithrestapi/components/already_have_an_account_acheck.dart';
import 'package:loginsignupwithrestapi/components/rounded_button.dart';
import 'package:loginsignupwithrestapi/components/rounded_input_field.dart';
import 'package:loginsignupwithrestapi/components/rounded_password_field.dart';
import 'package:loginsignupwithrestapi/screens/Login/login_screen.dart';
import 'package:loginsignupwithrestapi/screens/Signup/components/background.dart';
import 'package:loginsignupwithrestapi/utils/api_constaints.dart';
import 'package:loginsignupwithrestapi/utils/constants.dart';
import 'package:loginsignupwithrestapi/utils/string_constaints.dart';
import 'package:http/http.dart' as http;


class Body extends StatelessWidget {
  String password='';
  String name ='';
  String email='';
  String cpassword='';

  void signUpRequest(BuildContext context) async
  {
    var map =new Map<String , dynamic>();
    map['name'] = name;
    map['email'] = email;
    map['password'] = password;
    map['password_confirmation'] = cpassword;

    http.Response response = await http.post('http://192.168.43.124:8000/api/auth/signup',
        headers:{
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded"
        },
        body: map,);
    print(response.body);
    if(response.statusCode == 200)
      {
        successToast(context, 'Registration Succesfull');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return LoginScreen();
            },
          ),
        );
      }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              StringConstaints.SIGNUP,
              style: TextStyle(fontFamily: 'Pacifico',fontSize: 20.0, color: Colors.purple),
            ),
            SizedBox(height: size.height * 0.01),
            Image.asset(
              "assets/images/logo.png",
              height: size.height * 0.35,
            ),
            RoundedInputField(
              hintText: "Name",
              onChanged: (value) {
                name = value;

              },
            ),

            RoundedInputField(
              hintText: "Email",
              onChanged: (value) {
                email = value ;
              },
            ),


            RoundedPasswordField(
              hintText: "Password",
              onChanged: (value) {
                password = value ;
             },
            ),

            RoundedPasswordField(
              hintText: "Match Password",
              onChanged: (value) {
              cpassword = value;
              },
            ),

            RoundedButton(
              text: StringConstaints.SIGNUP,
              press: () {
                if(name.isEmpty){errorToast(context,StringConstaints.ERRORNAME);}
                else if(email.isEmpty){errorToast(context,StringConstaints.ERROREMAIL);}
                else if(password.isEmpty){errorToast(context,StringConstaints.ERRORPASSWORD);}
                else if(cpassword.isEmpty){errorToast(context,StringConstaints.ERRORPASSWORD);}
                else if(password != cpassword ){errorToast(context,StringConstaints.ERRORNOTMATCH);}
               // else if(!regex.hasMatch(name)){errorToast(context,StringConstaints.VALIDNAME);}
              //  else if(!emailRegExp.hasMatch(email)){errorToast(context,StringConstaints.VALIDNAME);}
                else{
                  signUpRequest(context);
                }


              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
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
