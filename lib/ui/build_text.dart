import 'package:flutter/material.dart';
import 'package:sap_portal/utils/constants.dart';

Padding buildTextFormFieldSecure(
    TextEditingController controller,
    BuildContext context,
    String labelText,
    TextInputType inputType,
    bool obsecure,
    bool autoCorrect,
    bool suggestions) {
  return Padding(
    padding: const EdgeInsets.all(14.0),
    child: Row(
      children: [
        SizedBox(
          width: 75,
          child: Text(labelText, style: textDisplay),
        ),
        Expanded(
            child: TextFormField(
          controller: controller,
          keyboardType: inputType,
          obscureText: obsecure,
          autocorrect: autoCorrect,
          enableSuggestions: suggestions,
          decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.only(left: 10),
              focusedBorder:
                  UnderlineInputBorder(borderSide: BorderSide(color: grey))),
        ))
      ],
    ),
  );
}

Padding buildTextFieldSecure(
    TextEditingController controller,
    BuildContext context,
    String labelText,
    TextInputType inputType,
    bool obsecure,
    bool autoCorrect,
    bool suggestions) {
  return Padding(
    padding: const EdgeInsets.all(14.0),
    child: Row(
      children: [
        SizedBox(
          width: 75,
          child: Text(labelText, style: textDisplay),
        ),
        Expanded(
            child: TextField(
          controller: controller,
          keyboardType: inputType,
          obscureText: obsecure,
          autocorrect: autoCorrect,
          enableSuggestions: suggestions,
          decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.only(left: 10),
              focusedBorder:
                  UnderlineInputBorder(borderSide: BorderSide(color: grey))),
        ))
      ],
    ),
  );
}

Padding buildTextField(
  TextEditingController controller,
  BuildContext context,
  String labelText,
  TextInputType inputType,
) {
  return Padding(
    padding: const EdgeInsets.all(14.0),
    child: Row(
      children: [
        SizedBox(
          width: 75,
          child: Text(labelText, style: textDisplay),
        ),
        Expanded(
            child: TextFormField(
          controller: controller,
          keyboardType: inputType,
          decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.only(left: 10),
              focusedBorder:
                  UnderlineInputBorder(borderSide: BorderSide(color: grey))),
        ))
      ],
    ),
  );
}
