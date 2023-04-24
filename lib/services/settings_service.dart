import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'translation_service.dart';

class SettingsService extends GetxService {
  GetStorage? box;

  Future<SettingsService> init() async {
    super.onInit();
    return this;
  }

  Locale getLocale() {
    String? locale = GetStorage().read<String>('language');
    if (locale == null || locale.isEmpty) {
      // locale = setting.value.mobileLanguage;
      locale = 'en';
    }
    return Get.find<TranslationService>().fromStringToLocale(locale);
  }
}
