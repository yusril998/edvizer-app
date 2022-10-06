import 'package:edvizer_app/screens/splash/splash_page.dart';
import 'package:get/get.dart';

class Routes {
  static final List<GetPage<dynamic>> pages = [
    GetPage(name: SplashPage.routeName, page: () => SplashPage()),
  ];
}
