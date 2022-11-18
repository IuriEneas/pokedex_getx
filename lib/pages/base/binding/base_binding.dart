import 'package:get/get.dart';
import 'package:pokedex_getx/pages/battle/controller/battle_controller.dart';

class BaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BattleController());
  }
}
