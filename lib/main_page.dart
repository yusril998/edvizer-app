import 'package:edvizer_app/config/routes.dart';
import 'package:edvizer_app/constants/app_themes.dart';
import 'package:edvizer_app/screens/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      initialRoute: SplashPage.routeName,
      getPages: Routes.pages,
    );
  }
}
