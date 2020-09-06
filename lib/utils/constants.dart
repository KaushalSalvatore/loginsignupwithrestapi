import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
const kPrimaryColor = Color(0xFF6F35A5);
const kPrimaryLightColor = Color(0xFFF1E6FF);
bool _isProgressDialogShowing = false;
BuildContext context;
final  emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
final  nameRegExp = RegExp(r'^[A-Za-z0-9]+(?:[ _-][A-Za-z0-9]+)*$', caseSensitive: false);

void errorToast(BuildContext context , String message)
{
  Fluttertoast.showToast(msg: message,
  toastLength: Toast.LENGTH_SHORT,
  gravity: ToastGravity.BOTTOM,
  timeInSecForIosWeb: 1,
  backgroundColor: Colors.red,
  textColor: Colors.white,
  fontSize: 16.0);
}

void successToast(BuildContext context , String message)
{
Fluttertoast.showToast(msg: message,
toastLength: Toast.LENGTH_SHORT,
gravity: ToastGravity.BOTTOM,
timeInSecForIosWeb: 1,
backgroundColor: Colors.green,
textColor: Colors.white,
fontSize: 16.0);
}

