import 'package:get/get.dart';
import 'package:pokedex_getx/routes/page_routes.dart';

class AuthController extends GetxController {
  bool isSecret = false;

  @override
  void onInit() {
    super.onInit();
    getToLoginPage();
  }

  Future<void> getToLoginPage() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.offAllNamed(PagesRoute.loginRoute);
  }

  Future<void> login() async {
    Get.offNamed(PagesRoute.baseRoute);
  }
}
