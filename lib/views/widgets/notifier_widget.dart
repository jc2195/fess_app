import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NotifierWidget{

  NotifierWidget({message}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 5,
      backgroundColor: const Color(0x7b000000),
      textColor: Colors.white,
      fontSize: 18,
    );
  }

}