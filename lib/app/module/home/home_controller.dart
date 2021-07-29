import 'package:email_validator/email_validator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thinky/app/core/Constants.dart';
import 'package:thinky/app/data/repository/auth_repository.dart';

class HomeController extends GetxController {
  AuthRepository _authRepository = Get.find();
  final ImagePicker _imagePicker = ImagePicker();
  Rx<bool> isLightTheme = false.obs;
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

  getCurrentTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    isLightTheme.value = sharedPreferences.getBool(KEY_IS_LIGHT_THEME) ?? false;
  }

  void onLogoutClicked() {
    _authRepository.logoutUser();
  }

  onChangeThemeClicked() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getBool(KEY_IS_LIGHT_THEME) ?? false) {
      sharedPreferences.setBool(KEY_IS_LIGHT_THEME, false);
      isLightTheme.value = false;
      Get.changeTheme(appDarkTheme);
    } else {
      sharedPreferences.setBool(KEY_IS_LIGHT_THEME, true);
      isLightTheme.value = true;
      Get.changeTheme(appLightTheme);
    }
  }

  void startUploadImageFlow() async {
    try {
      var xFile = await _imagePicker.pickImage(source: ImageSource.gallery);
      pickedImagePath.value = xFile?.path ?? "";
    } catch (e) {
      errorText.value = e.toString();
    }
  }
}
