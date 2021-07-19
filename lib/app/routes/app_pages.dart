import 'package:get/get.dart';
import 'package:thinky/app/module/login/login_screen.dart';
import 'package:thinky/app/module/register/register_screen.dart';
import 'package:thinky/app/module/welcome/welcome_screen.dart';
import 'package:thinky/app/routes/app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.INITIAL, page: () => WelcomeScreen()),
    GetPage(name: AppRoutes.LOGIN, page: () => LoginScreen()),
    GetPage(name: AppRoutes.REGISTER, page: () => RegisterScreen())
  ];
}
