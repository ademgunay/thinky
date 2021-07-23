import 'package:email_validator/email_validator.dart';
import 'package:get/get.dart';
import 'package:thinky/app/core/response_result.dart';
import 'package:thinky/app/core/widget/loading_dialog.dart';
import 'package:thinky/app/data/repository/auth_repository.dart';

class LoginController extends GetxController {
  AuthRepository _authRepository = Get.find<AuthRepository>();

  Rx<String> email = "".obs;
  Rx<String> password = "".obs;
  Rx<String> errorText = "".obs;

  String? emailValidator() {
    errorText.value = "";
    return EmailValidator.validate(email.value)
        ? null
        : "Please enter a valid email";
  }

  String? passwordValidator() {
    errorText.value = "";
    if (password.value.length < 6) {
      return "At least 6 characters";
    } else if (password.isEmpty) {
      return "Password is required";
    } else {
      return null;
    }
  }

  Future<void> onLoginClicked() async {
    errorText.value = "";
    Get.loadingDialog();
    ResponseResult result =
        await _authRepository.loginUser(email.value, password.value);
    Get.back();
    if (result is CompleteResult) {
      print("LOGIN SUCCESS: $result");
      //TODO Handle success case
    } else if (result is ErrorResult) {
      print("LOGIN FAILED: $result");
      errorText.value =
          result.exception.message ?? "Something went wrong. Try again later";
    }
  }
}
