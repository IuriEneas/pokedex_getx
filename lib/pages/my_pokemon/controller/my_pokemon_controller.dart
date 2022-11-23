import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:pokedex_getx/pages/base/controller/base_controller.dart';
import 'package:pokedex_getx/pages/battle/controller/battle_controller.dart';

class MyPokemonController extends GetxController {
  final CollectionReference _pokemon =
      FirebaseFirestore.instance.collection('myPokemon');

  final controller = Get.find<BaseController>();
  final _ = Get.find<BattleController>();

  void savePokemon() async {
    final random = Random();
    final listSize = controller.pokemonList.length;
    final pokemonModel = controller.pokemonList[random.nextInt(listSize - 1)];

    final pokemon = await _.createPokemon(pokemonModel);

    pokemon.pokemonModel?.completeMoves?.length;

    Map<String, dynamic> map = {
      for (var e in pokemon.ownedMoves!) e.name!: e.toJson()
    };

    await _pokemon.doc().set(pokemon.toJson());
  }
}
