import 'package:email_validator/email_validator.dart';
import 'package:get/get.dart';
import 'package:thinky/app/data/repository/auth_repository.dart';

class HomeController extends GetxController {
  AuthRepository _authRepository = Get.find();
  Rx<String> email = "".obs;
  Rx<String> errorText = "".obs;

  String? emailValidator() {
    errorText.value = "";
    return EmailValidator.validate(email.value)
        ? null
        : "Please enter a valid email";
  }

  Future<void> onSendClicked() async {
    //TODO
  }

  void onLogoutClicked() {
    _authRepository.logoutUser();
  }

}