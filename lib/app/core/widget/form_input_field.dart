import 'package:flutter/material.dart';

class FormInputField extends StatelessWidget {
  final String formText;
  final String hintText;
  final Function(String) onChanged;
  final Function(String?) validator;

  const FormInputField(
      {required this.formText,
      required this.hintText,
      required this.onChanged,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: true,
      onChanged: (newValue) => onChanged(newValue),
      validator: (value) => validator(value),
      decoration:
          InputDecoration(border: OutlineInputBorder(), hintText: hintText),
    );
  }
}
