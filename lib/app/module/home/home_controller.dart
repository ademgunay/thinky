import 'package:email_validator/email_validator.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
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

}