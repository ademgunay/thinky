import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:thinky/app/data/repository/auth_repository.dart';
import 'package:thinky/app/routes/app_pages.dart';
import 'package:thinky/app/routes/app_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final AuthRepository authRepository = Get.put(AuthRepository());

  @override
  Widget build(BuildContext context) {

    print(authRepository.isSignedIn());

    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        inputDecorationTheme: InputDecorationTheme(
          focusColor: Colors.purple,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.purple)
          ),
        ),
      ),
      initialRoute: AppRoutes.INITIAL,
      getPages: AppPages.pages,
    );
  }
}
