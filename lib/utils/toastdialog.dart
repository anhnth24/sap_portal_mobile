import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'constants.dart';

void notificationSuccess(String msg) {
  Fluttertoast.showToast(
      msg: msg, // message
      toastLength: Toast.LENGTH_SHORT, // length
      gravity: ToastGravity.BOTTOM, // location
      timeInSecForIosWeb: 1, // duration
      backgroundColor: primaryColor,
      textColor: Colors.white);
}

void notificationError(String msg) {
  Fluttertoast.showToast(
      msg: msg, // message
      toastLength: Toast.LENGTH_SHORT, // length
      gravity: ToastGravity.BOTTOM, // location
      timeInSecForIosWeb: 1, // duration
      backgroundColor: Colors.red,
      textColor: Colors.white);
}
