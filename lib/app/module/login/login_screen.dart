import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Login to Thinky",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
              SizedBox(height: 32),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: TextFormField(
                  autocorrect: false,
                  onChanged: (newText) {
                    //TODO
                  },
                  //TODO
                  // validator: (_) => _registerController.emailValidator(),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your email',
                  ),
                  cursorColor: Colors.purple,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: TextFormField(
                  obscureText: true,
                  autocorrect: false,
                  onChanged: (password) {
                    //TODO
                    // _registerController.password.value = password;
                  },
                  //TODO
                  // validator: (_) => _registerController.passwordValidator(),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your password',
                  ),
                  cursorColor: Colors.purple,
                ),
              ),
              SizedBox(height: 32),
              ElevatedButton(
                child: Text("Login"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                  textStyle: TextStyle(fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  //TODO
                },
              ),
            ],
          ),
        ),
      );
}
