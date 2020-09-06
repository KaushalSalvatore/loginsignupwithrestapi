import 'package:flutter/material.dart';
import 'package:loginsignupwithrestapi/components/text_field_container.dart';
import 'package:loginsignupwithrestapi/utils/constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final String hintText;

  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key key,
    this.hintText,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          suffixIcon: Icon(
            Icons.visibility,
            color: kPrimaryColor,
          ),


          border: InputBorder.none,
        ),
      ),
    );
  }
}
