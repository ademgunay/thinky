import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:thinky/app/routes/app_pages.dart';
import 'package:thinky/app/routes/app_routes.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppRoutes.INITIAL,
    );
  }
}
