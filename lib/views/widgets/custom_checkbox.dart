import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget{

  final bool checked;
  final Function onPressed;

  CustomCheckbox({this.checked = false, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 23.0,
        height: 23.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: const Color(0x7b000000),
        ),
        child: SizedBox(
          width: 23.0,
          height: 23.0,
          child: checked ? Icon(
            Icons.done,
            color: Colors.white,
          ) : null,
        ),
      ),
    );
  }
}