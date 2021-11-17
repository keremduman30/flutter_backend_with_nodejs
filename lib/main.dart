import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tekrar/core/constant/app/app_constant.dart';
import 'package:tekrar/core/init/cache/locale_manager.dart';
import 'package:tekrar/core/init/language/language_manager.dart';
import 'package:tekrar/core/init/navigation/navigation_service.dart';
import 'package:tekrar/core/init/navigation/navigator_route.dart';
import 'package:tekrar/core/init/notifier/application_provider.dart';
import 'package:tekrar/core/init/notifier/thema_notifier.dart';
import 'package:tekrar/view/product/widget/yonlendirme_widget.dart';

void main() async {
  await _init();
  runApp(
    MultiProvider(
      providers: [...ApplicationProvider.instance.dependItems],
      child: EasyLocalization(
        path: AppConstant.langAssetPath,
        supportedLocales: LanguageManager.instance.supportLocale,
        startLocale: LanguageManager.instance.trLocale,
        child: MyApp(),
      ),
    ),
  );
}

Future<void> _init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await LocaleManager.prefrencesInit();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      localizationsDelegates: context.localizationDelegates,
      title: "tekrarlar",
      navigatorKey: NavigationService.instance.navigatorKey,
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      debugShowCheckedModeBanner: false,
      theme: context.watch<ThemeNotifier>().currentTheme,
      home: YonlendirmeWidget(),
    );
  }
}
