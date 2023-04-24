import './services/settings_service.dart';
import './services/translation_service.dart';
import './services/global_service.dart';
import './services/auth_service.dart';
import './routes/app_routes.dart';
import './common/ui.dart';

import 'package:month_year_picker/month_year_picker.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

initServices() async {
  await GetStorage.init();
  await Get.putAsync(() => TranslationService().init());
  await Get.putAsync(() => GlobalService().init());
  await Get.putAsync(() => AuthService().init());
  await Get.putAsync(() => SettingsService().init());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  // This widget is the root of your application.
  runApp(
    GetMaterialApp(
      title: 'Paper Manager',
      localizationsDelegates: const [
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        MonthYearPickerLocalizations.delegate
      ],
      supportedLocales: Get.find<TranslationService>().supportedLocales(),
      locale: Get.find<SettingsService>().getLocale(),
      initialRoute: '/intro',
      theme: ThemeData(
        primaryColor: Colors.white,
        secondaryHeaderColor: Colors.white,
        bottomAppBarColor: Colors.white70
      ),
      debugShowCheckedModeBanner: false,
      getPages: AppRoute.routes,
    ),
  );
}