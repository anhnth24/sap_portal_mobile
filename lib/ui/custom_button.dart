import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key, required this.buttonText, required this.onPress})
      : super(key: key);
  final String buttonText;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            height: 100,
            width: 570,
            padding: const EdgeInsets.all(20),
            // ignore: deprecated_member_use
            child: RaisedButton(
                color: Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                onPressed: onPress,
                child: Text(buttonText,
                    style: const TextStyle(color: Colors.white))),
          )
        ],
      ),
    );
  }
}
