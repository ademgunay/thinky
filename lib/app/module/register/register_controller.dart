import 'package:email_validator/email_validator.dart';
import 'package:get/get.dart';
import 'package:thinky/app/core/response_result.dart';
import 'package:thinky/app/core/widget/loading_dialog.dart';
import 'package:thinky/app/data/repository/auth_repository.dart';
import 'package:thinky/app/routes/app_routes.dart';

class RegisterController extends GetxController {
  AuthRepository _authRepository = Get.find<AuthRepository>();
  Rx<String> email = "".obs;
  Rx<String> password = "".obs;
  Rx<String> confirmedPassword = "".obs;
  Rx<String> errorText = "".obs;

  Future<void> submitRegistrationForm() async {
    clearErrors();
    Get.loadingDialog();
    ResponseResult result =
        await _authRepository.registerUser(email.value, password.value);
    Get.back();
    if (result is CompleteResult) {
      Get.offAndToNamed(AppRoutes.LOGIN);
    } else if (result is ErrorResult) {
      errorText.value =
          result.exception.message != null ? result.exception.message! : "";
    }
  }

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

  String? confirmedPasswordValidator() {
    errorText.value = "";
    if (confirmedPassword.value != password.value) {
      return "This doesn't match password";
    } else {
      return null;
    }
  }

  void clearErrors() {
    errorText.value = "";
  }
}
