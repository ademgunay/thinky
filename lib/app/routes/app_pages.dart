import 'package:get/get.dart';
import 'package:thinky/app/module/home/home_bindings.dart';
import 'package:thinky/app/module/home/home_screen.dart';
import 'package:thinky/app/module/login/login_bindings.dart';
import 'package:thinky/app/module/login/login_screen.dart';
import 'package:thinky/app/module/register/register_bindings.dart';
import 'package:thinky/app/module/register/register_screen.dart';
import 'package:thinky/app/module/welcome/welcome_screen.dart';
import 'package:thinky/app/routes/app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.INITIAL,
      page: () => WelcomeScreen(),
    ),
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => LoginScreen(),
      binding: LoginBindings(),
    ),
    GetPage(
      name: AppRoutes.REGISTER,
      page: () => RegisterScreen(),
      binding: RegisterBindings(),
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomeScreen(),
      binding: HomeBindings(),
    ),
  ];
}
