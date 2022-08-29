// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final TextEditingController controller;
  final Color baseColor;
  final Color borderColor;
  final Color errorColor;
  final TextInputType inputType;
  final bool obscureText;
  final Function onChanged;

  const CustomTextField({
    required this.hint,
    required this.controller,
    required this.onChanged,
    required this.baseColor,
    required this.borderColor,
    required this.errorColor,
    this.inputType = TextInputType.text,
    this.obscureText = false,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  Color currentColor = Colors.white;

  @override
  void initState() {
    super.initState();
    currentColor = widget.borderColor;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: currentColor, width: 2.0),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: TextField(
          obscureText: widget.obscureText,
          onChanged: (text) {
            widget.onChanged(text);
          },
          //keyboardType: widget.inputType,
          controller: widget.controller,
          decoration: InputDecoration(
            hintStyle: TextStyle(
              color: widget.baseColor,
              fontFamily: "San Francisco",
              fontWeight: FontWeight.w300,
            ),
            border: InputBorder.none,
            hintText: widget.hint,
          ),
        ),
      ),
    );
  }
}
