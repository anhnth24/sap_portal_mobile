import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void notification_success(String msg) {
  Fluttertoast.showToast(
      msg: msg, // message
      toastLength: Toast.LENGTH_SHORT, // length
      gravity: ToastGravity.BOTTOM, // location
      timeInSecForIosWeb: 1, // duration
      backgroundColor: Colors.green,
      textColor: Colors.white);
}

void notification_error(String msg) {
  Fluttertoast.showToast(
      msg: msg, // message
      toastLength: Toast.LENGTH_SHORT, // length
      gravity: ToastGravity.BOTTOM, // location
      timeInSecForIosWeb: 1, // duration
      backgroundColor: Colors.red,
      textColor: Colors.white);
}
