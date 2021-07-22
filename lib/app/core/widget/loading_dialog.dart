import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension LoadingDialogGet on GetInterface {
  Future loadingDialog() {
    return Get.dialog(
      Center(
        child: CircularProgressIndicator(
          color: Colors.purple,
        ),
      ),
      barrierDismissible: false,
    );
  }
}
