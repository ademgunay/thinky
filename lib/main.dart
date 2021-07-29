import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:thinky/app/data/repository/auth_repository.dart';
import 'package:thinky/app/routes/app_pages.dart';
import 'package:thinky/app/routes/app_routes.dart';

import 'app/core/Constants.dart';

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
      title: 'Thinky',
      theme: appDarkTheme,
      initialRoute:
          //TODO when have time:
          /// You should not use this getter to determine the users current state,
          /// instead use [authStateChanges], [idTokenChanges] or [userChanges] to
          /// subscribe to updates.
          authRepository.isSignedIn() ? AppRoutes.HOME : AppRoutes.INITIAL,
      getPages: AppPages.pages,
    );
  }
}
