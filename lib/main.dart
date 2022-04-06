import 'package:example_getx/pages/home_page.dart';
import 'package:example_getx/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'controllers/translator_controller.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static final appData = GetStorage();

  @override
  Widget build(BuildContext context) {
    appData.writeIfNull("darkMode", true);
    return SimpleBuilder(
      builder: (_) {
        bool isDarkMode = appData.read("darkMode");
        return GetMaterialApp(
          translations: TranslatorGetX(),
          locale: const Locale('en', "US"),
          fallbackLocale: const Locale('en', "US"),
          theme: isDarkMode ? Themes().darkTheme : Themes().lightTheme,
          title: 'Flutter Demo',
          home: HomePage(),
        );
      },
    );
  }
}
