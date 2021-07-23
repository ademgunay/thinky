import 'package:get/get.dart';
import 'package:thinky/app/module/login/login_controller.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(LoginController());
  }
}
