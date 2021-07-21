import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:thinky/app/data/model/response_result.dart';
import 'package:thinky/app/data/repository/auth_repository.dart';
import 'package:thinky/app/routes/app_routes.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final AuthRepository _authRepository = Get.find<AuthRepository>();
  final TextEditingController emailTextController = TextEditingController();
  String email = "";
  String password = "";
  String confirmedPassword = "";

  bool _isValidEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

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
                    onChanged: (newText) {
                      email = newText;
                    },
                    validator: (email) {
                      if (_isValidEmail(email!)) {
                        return null;
                      } else {
                        return "Please enter a valid email";
                      }
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter your email'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: TextFormField(
                    obscureText: true,
                    onChanged: (newText) {
                      password = newText;
                    },
                    validator: (password) {
                      if (password!.length < 6) {
                        return "At least 6 characters";
                      } else if (password.isEmpty) {
                        return "Password is required";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter your password'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: TextFormField(
                    obscureText: true,
                    onChanged: (newText) {
                      confirmedPassword = newText;
                    },
                    validator: (confirmedPassword) {
                      if (confirmedPassword != password) {
                        return "This doesn't match password";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Confirm your password'),
                  ),
                ),
                SizedBox(height: 32),
                ElevatedButton(
                  child: Text("Submit"),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      //TODO Show progress
                      ResponseResult result =
                          await _authRepository.registerUser(email, password);
                      //TODO Hide progress
                      if (result is SuccessResult) {
                        Get.snackbar("Success", "Submitted!",
                            snackPosition: SnackPosition.BOTTOM);
                      } else if (result is ErrorResult) {
                        Get.snackbar("API Error", "${result.exception}");
                      }
                      Get.offAndToNamed(AppRoutes.LOGIN);
                    } else {
                      Get.snackbar("Fail", "Check errors",
                          snackPosition: SnackPosition.BOTTOM);
                    }
                  },
                ),
                SizedBox(height: 48),
              ],
            ),
          ),
        ),
      );
}
