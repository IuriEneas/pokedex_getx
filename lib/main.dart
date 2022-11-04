import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex_getx/pages/base/base_controller.dart';
import 'package:pokedex_getx/routes/page_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(BaseController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppPages.pages,
      initialRoute: PagesRoute.baseRoute,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
