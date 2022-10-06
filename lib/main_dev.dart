import 'dart:async';

import 'package:edvizer_app/config/config_apps.dart';
import 'package:edvizer_app/constants/app_enpoint.dart';
import 'package:edvizer_app/main_page.dart';
import 'package:edvizer_app/utils/storage_utils.dart';
import 'package:flutter/material.dart';

void main() {
  ConfigApps(
      flavor: Flavor.PRODUCTION,
      baseUrl: AppEndpoint.BASE_URL_PROD,
      token: AppEndpoint.TOKEN_PROD);
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    StorageUtils().init();
    runApp(MainPage());
  }, (error, stack) => null);
}
