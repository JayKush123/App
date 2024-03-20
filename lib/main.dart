import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:test/model/ad_banner.dart';
import 'package:test/model/category.dart';
import 'package:test/model/product.dart';
import 'package:test/route/app_page.dart';
import 'package:test/route/app_route.dart';
import 'package:test/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  //register adapters
  Hive.registerAdapter(AdBannerAdapter());
  Hive.registerAdapter(AllCategoryAdapter());
  Hive.registerAdapter(ProductAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppPage.list,
      initialRoute: AppRoute.dashboard,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
    );
  }
}
