import 'package:get/get.dart';
import 'package:pokedex_getx/pages/battle/controller/battle_controller.dart';
import 'package:pokedex_getx/pages/my_pokemon/controller/my_pokemon_controller.dart';

class BaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BattleController());
    Get.put(MyPokemonController());
  }
}
