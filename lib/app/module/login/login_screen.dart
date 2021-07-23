import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

class LoginScreen extends StatelessWidget {
  final LoginController _loginController = Get.find<LoginController>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: Form(
            key: _formKey,
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
                    onChanged: (email) {
                      _loginController.email.value = email;
                    },
                    validator: (_) => _loginController.emailValidator(),
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
                      _loginController.password.value = password;
                    },
                    validator: (_) => _loginController.passwordValidator(),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your password',
                    ),
                    cursorColor: Colors.purple,
                  ),
                ),
                SizedBox(height: 32),
                Obx(
                  () => Visibility(
                    visible:
                        _loginController.errorText.value != "" ? true : false,
                    child: Text(
                      _loginController.errorText.value,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
                ElevatedButton(
                  child: Text("Login"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                    textStyle: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    if (_formKey.currentState?.validate() == true) {
                      _loginController.onLoginClicked();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      );
}
