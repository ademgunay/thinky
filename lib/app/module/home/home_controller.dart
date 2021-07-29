import 'package:email_validator/email_validator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:thinky/app/data/repository/auth_repository.dart';

class HomeController extends GetxController {
  AuthRepository _authRepository = Get.find();
  final ImagePicker _imagePicker = ImagePicker();
  Rx<String> email = "".obs;
  Rx<String> errorText = "".obs;
  Rx<String> pickedImagePath = "".obs;

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

  void startUploadImageFlow() async {
    try {
      var xFile = await _imagePicker.getImage(source: ImageSource.gallery);
      pickedImagePath.value = xFile?.path ?? "";
    } catch (e) {
      errorText.value = e.toString();
    }
  }
}
