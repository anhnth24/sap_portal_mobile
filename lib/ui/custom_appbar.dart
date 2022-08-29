import 'package:flutter/material.dart';
import 'package:sap_portal/utils/constants.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({Key? key, required this.appBarTitle}) : super(key: key);
  final String appBarTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        backgroundColor: primaryColor,
      ),
    );
  }
}
