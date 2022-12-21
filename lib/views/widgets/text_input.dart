import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';

class TextInput extends StatelessWidget{
  final String hintText;
  final String labelText;
  final String errorText;
  final Function onChanged;
  final bool isPassword;
  final bool isEmail;
  final bool isError;

  TextInput({
    this.hintText = '',
    this.labelText = '',
    this.errorText = '',
    this.onChanged,
    this.isPassword = false,
    this.isEmail = false,
    this.isError = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: EdgeInsets.only(left: 12, right: 12),
          margin: EdgeInsets.only(left: 42, right: 42, bottom: 7),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              isError ? errorText : labelText,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16,
                color: isError ? Colors.red : Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 12, right: 12),
          margin: EdgeInsets.only(left: 42, right: 42),
          height: 47.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: const Color(0x7b000000),
            border: isError ? Border.all(width: 1, color: Colors.red) : null,
          ),
          child: TextField(
            onChanged: onChanged,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: TextStyle(
                fontSize: 20,
                color: const Color(0x98ffffff),
                fontWeight: FontWeight.w700,
              ),
            ),
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
            obscureText: isPassword,
            keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
          ),
        ),
      ],
    );
  }
}