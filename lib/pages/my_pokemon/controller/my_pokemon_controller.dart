import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:pokedex_getx/pages/base/controller/base_controller.dart';
import 'package:pokedex_getx/pages/battle/controller/battle_controller.dart';

class MyPokemonController extends GetxController {
  final CollectionReference pokemonRef =
      FirebaseFirestore.instance.collection('myPokemon');

  late DocumentSnapshot documentSnapshot;

  final controller = Get.find<BaseController>();
  final _ = Get.find<BattleController>();

  void getPokemon() async {}

  void savePokemon() async {
    final random = Random();
    final listSize = controller.pokemonList.length;
    final pokemonModel = controller.pokemonList[random.nextInt(listSize - 1)];

    final pokemon = await _.createPokemon(pokemonModel);
    await pokemonRef.doc().set(pokemon.toJson());
  }
}
