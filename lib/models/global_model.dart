import 'package:flutter/material.dart';

class GlobalModel extends ChangeNotifier{
  bool keyboardHeightIsSet = false;
  int deviceKeyboardHeight;

  final String university;
  final String college;

  GlobalModel({this.university, this.college});
}