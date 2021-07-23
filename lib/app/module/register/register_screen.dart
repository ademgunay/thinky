import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:thinky/app/module/register/register_controller.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final RegisterController _registerController = Get.find();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 32),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.symmetric(vertical: 18),
                    child: Text(
                      "Register for Thinky",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                    )),
                SizedBox(height: 18),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: TextFormField(
                    autocorrect: false,
                    onChanged: (newText) {
                      _registerController.email.value = newText;
                    },
                    validator: (_) => _registerController.emailValidator(),
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
                      _registerController.password.value = password;
                    },
                    validator: (_) => _registerController.passwordValidator(),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your password',
                    ),
                    cursorColor: Colors.purple,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: TextFormField(
                    obscureText: true,
                    autocorrect: false,
                    onChanged: (confirmedPassword) {
                      _registerController.confirmedPassword.value =
                          confirmedPassword;
                    },
                    validator: (_) =>
                        _registerController.confirmedPasswordValidator(),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Confirm your password',
                    ),
                    cursorColor: Colors.purple,
                  ),
                ),
                SizedBox(height: 32),
                Obx(
                  () => Visibility(
                    visible: _registerController.errorText.value != ""
                        ? true
                        : false,
                    child: Text(
                      _registerController.errorText.value,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
                ElevatedButton(
                  child: Text("Submit"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                    textStyle: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    if (_formKey.currentState?.validate() == true) {
                      _registerController.submitRegistrationForm();
                    }
                  },
                ),
                SizedBox(height: 100), //Compensate AppBar height
              ],
            ),
          ),
        ),
      );
}
