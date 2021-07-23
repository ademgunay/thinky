import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension LoadingDialogGet on GetInterface {
  Future loadingDialog({bool dismissible = false}) {
    return Get.dialog(
      Center(
        child: CircularProgressIndicator(
          color: Colors.purple,
        ),
      ),
      barrierDismissible: dismissible,
    );
  }
}
