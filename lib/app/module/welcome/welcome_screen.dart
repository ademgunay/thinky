import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thinky/app/routes/app_routes.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  child: Text(
                    "Welcome to Thinky!",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                ),
              ),
              SizedBox(height: 100),
              ElevatedButton(
                onPressed: () => Get.toNamed(AppRoutes.LOGIN),
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                  textStyle: TextStyle(fontWeight: FontWeight.bold),
                ),
                child: Text("Login"),
              ),
              ElevatedButton(
                onPressed: () => Get.toNamed(AppRoutes.REGISTER),
                style: ElevatedButton.styleFrom(
                  primary: Colors.purple,
                  textStyle: TextStyle(fontWeight: FontWeight.bold),
                ),
                child: Text("Register"),
              ),
            ],
          ),
        ),
      );
}
