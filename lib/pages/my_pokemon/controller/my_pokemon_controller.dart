import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:pokedex_getx/pages/base/controller/base_controller.dart';
import 'package:pokedex_getx/pages/battle/controller/battle_controller.dart';

class MyPokemonController extends GetxController {
  final CollectionReference pokemonRef =
      FirebaseFirestore.instance.collection('myPokemon');

  late DocumentSnapshot documentSnapshot;
  late QuerySnapshot querySnapshot;

  final controller = Get.find<BaseController>();
  final _ = Get.find<BattleController>();

  void getPokemon() async {}

  bool capturePokemon(double captureRate) {
    Random random = Random();

    List<double> chances = [captureRate];
    bool dropped = false;
    double n = random.nextDouble() * 100;

    for (int i = 0; i < chances.length; i++) {
      if (chances[i] >= n) {
        print("Capturou o pokemon com ${chances[i]}% de chance ($n)");
        dropped = true;
        break;
      }
    }
    if (dropped == false) {
      print("Não capturou");
    }

    return dropped;
  }

  void savePokemon() async {
    final random = Random();
    final listSize = controller.pokemonList.length;
    final pokemonModel = controller.pokemonList[random.nextInt(listSize - 1)];

    final pokemon = await _.createPokemon(pokemonModel);
    await pokemonRef.doc().set(pokemon.toMap());
  }
}
