import 'package:get/get.dart';
import 'package:pokedex_getx/pages/my_pokemon/controller/my_pokemon_controller.dart';

import '../../battle/controller/battle_controller.dart';

class BaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MyPokemonController());
    Get.put(BattleController());
  }
}
