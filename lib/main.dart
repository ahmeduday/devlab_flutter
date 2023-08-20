import 'package:devlab_flutter/new_licences.dart';
import 'package:devlab_flutter/router.dart';
// import 'package:devlab_flutter/supported_locales.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> ensureInitialized() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('settings');
  // EasyLocalization.logger.enableLevels = [];
  // await EasyLocalization.ensureInitialized();
  addLicenses();
}

Future<void> main() async {
  await ensureInitialized();

  // runApp(EasyLocalization(
  //     path: 'assets/translations',
  //     assetLoader: YamlAssetLoader(),
  //     fallbackLocale: const Locale("en", "US"),
  //     supportedLocales: supportedLocales.map((l) => l.locale).toList(),
  //     child: const Main()));

  runApp(const Main());
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
        child: MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      // localizationsDelegates: context.localizationDelegates,
      // supportedLocales: context.supportedLocales,
      // locale: context.locale,
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      //   useMaterial3: true,
      // ),
      title: "Dev Lab",
    ));
  }
}
