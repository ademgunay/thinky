import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {

  final String buttonText;
  final Function onClicked;

  const DefaultButton({required this.buttonText, required this.onClicked});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClicked(),
      // await _authRepository.registerUser(email, password);
      style: ElevatedButton.styleFrom(
        primary: Colors.purple,
        textStyle: TextStyle(fontWeight: FontWeight.bold),
      ),
      child: Text(buttonText),
    );
  }
}
