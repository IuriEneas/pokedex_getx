import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:pokedex_getx/model/pokemon_model.dart';
import 'package:pokedex_getx/pages/base/controller/base_controller.dart';
import 'package:pokedex_getx/pages/battle/repository/pokemon_cap_repository.dart';
import 'package:pokedex_getx/pages/pokemon_detail/repository/pokemon_repository.dart';
import 'package:pokedex_getx/services/helper.dart';

import '../../../model/pokemon_capturable_model.dart';

class BattleController extends GetxController {
  final controller = Get.find<BaseController>();
  final repository = PokemonCapRepository();
  final pokemonRepository = PokemonRepository();
  late PokemonCapModel pokemon;
  PokemonCapModel? opoPokemon;

  final CollectionReference pokemonRef =
      FirebaseFirestore.instance.collection('myPokemon');

  late DocumentSnapshot documentSnapshot;
  late QuerySnapshot querySnapshot;

  @override
  void onInit() {
    randomPokemon();
    super.onInit();
  }

  randomPokemon() async {
    Random random = Random();
    int randomPoke = random.nextInt(controller.pokemonList.length - 1);

    if (controller.pokemonList[randomPoke].id! > 10000) {
      do {
        randomPoke = random.nextInt(controller.pokemonList.length - 1);
      } while (controller.pokemonList[randomPoke].id! > 10000);
    }

    querySnapshot = await pokemonRef.get();

    await getPokemon(controller.pokemonList[randomPoke]);

    if (querySnapshot.docs.isNotEmpty) {
      documentSnapshot = querySnapshot.docs[0];
      pokemon = PokemonHelper.convert(documentSnapshot);
    }
  }

  Future<void> getPokemon(PokemonModel pokemon) async {
    opoPokemon = await createPokemon(pokemon);
  }

  attack(PokemonCapModel pokemon, PokemonCapModel oPokemon, int index) async {
    if (pokemon.isAlive) {
      oPokemon.damageTaken += pokemon.ownedMoves![index].power as int;

      if (oPokemon.damageTaken >= oPokemon.hp) {
        oPokemon.isAlive = false;
      }

      print(pokemon.ownedMoves![index].power);
      print(oPokemon.isAlive);
      update();
    }
    await Future.delayed(const Duration(seconds: 1));

    if (oPokemon.isAlive) {
      pokemon.damageTaken += oPokemon.ownedMoves![0].power as int;

      if (pokemon.damageTaken == pokemon.hp) {
        pokemon.isAlive = false;
      }
    }

    update();
  }

  double dealDamage(double damageTaken, double damageDelt) {
    return damageTaken + damageDelt;
  }

  Future<PokemonCapModel> createPokemon(PokemonModel pokemonModel) async {
    final pokemonSpeciesModel =
        await repository.getPokemonSpecies(pokemonModel.species!.url!);

    pokemonModel.completeMoves = [];
    final random = Random();
    int num = random.nextInt(4);
    final moveNum = pokemonModel.moves!.length;

    if (num == 0) num = 1;

    for (var i = 1; i <= num; i++) {
      int randomMoves = random.nextInt(moveNum);

      if (randomMoves == 0) randomMoves = 1;

      pokemonModel.completeMoves?.add(
        await pokemonRepository.getMove(
          pokemonModel.moves![randomMoves].move!.name!,
        ),
      );
    }

    int randomLvl = random.nextInt(100);

    if (randomLvl == 0) randomLvl = 1;

    final growth = await repository
        .getPokemonGrowth(pokemonSpeciesModel.growthRate!.name!);

    final level = isFirstPokemon() ? 5 : pokemonLvlProbability(lvl: media());

    final PokemonCapModel poke = PokemonCapModel(
      pokemonModel: pokemonModel,
      pokemonSpeciesModel: pokemonSpeciesModel,
      ownedMoves: [],
      level: level,
      exp: 0,
      expMax: growth.levels![level].experience,
    );

    poke.ownedMoves!.addAll(poke.pokemonModel!.completeMoves!);
    poke.pokemonModel!.moves!.clear();
    poke.pokemonModel!.completeMoves!.clear();

    return poke;
  }

  int media() {
    int value = 0;

    for (DocumentSnapshot a in querySnapshot.docs) {
      value += a['level'] as int;
    }

    return (value / querySnapshot.docs.length).ceil();
  }

  int pokemonLvlProbability({required int lvl}) {
    int total;
    Random random = Random();
    double n = random.nextDouble();

    if (lvl < 16) {
      total = ((n * lvl) / 2).floor() + lvl;
    } else if (lvl < 32) {
      total = ((n * lvl) / 3).floor() + lvl;
    } else if (lvl < 64) {
      total = ((n * lvl) / 4).floor() + lvl;
    } else {
      total = ((n * lvl) / 5).floor() + lvl;
    }

    if (total > 99) {
      total = 99;
    } else if (total <= 0) {
      total = 1;
    }

    return total;
  }

  bool isFirstPokemon() {
    if (querySnapshot.docs.isEmpty) return true;
    return false;
  }
}
