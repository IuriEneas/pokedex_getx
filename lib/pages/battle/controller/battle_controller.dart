// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:get/get.dart';
import 'package:pokedex_getx/model/move_model.dart';
import 'package:pokedex_getx/model/pokemon_model.dart';
import 'package:pokedex_getx/pages/base/controller/base_controller.dart';
import 'package:pokedex_getx/pages/battle/repository/pokemon_cap_repository.dart';
import 'package:pokedex_getx/pages/pokemon_detail/repository/pokemon_repository.dart';

import '../../../model/pokemon_capturable_model.dart';

class BattleController extends GetxController {
  final controller = Get.find<BaseController>();
  final repository = PokemonCapRepository();
  final pokemonRepository = PokemonRepository();
  late PokemonCapModel pokemon;
  late PokemonCapModel opoPokemon;

  MoveModel move = MoveModel(
    name: 'name',
    type: Type(
      name: 'name',
      url: 'url',
    ),
    accuracy: 100,
    power: 2,
    pp: 3,
    priority: 1,
  );

  @override
  void onInit() {
    getPokemon(controller.pokemonList[4], controller.pokemonList[3]);
    super.onInit();
  }

  Future<void> getPokemon(PokemonModel pokemon, PokemonModel oPokemon) async {
    final species = await repository.getPokemonSpecies(pokemon.name);
    final growtRate =
        await repository.getPokemonGrowth(species.growthRate.name);

    final myPokemon = PokemonCapModel(
      exp: 20000,
      expMax: growtRate.levels[50].experience,
      level: 51,
      pokemonModel: pokemon,
      pokemonSpeciesModel: species,
      ownedMoves: [move],
    );

    final oSpecies = await repository.getPokemonSpecies(oPokemon.name);
    final oGrowtRate =
        await repository.getPokemonGrowth(oSpecies.growthRate.name);

    opoPokemon = PokemonCapModel(
      exp: 30,
      expMax: oGrowtRate.levels[18].experience,
      level: 17,
      pokemonModel: oPokemon,
      pokemonSpeciesModel: oSpecies,
      ownedMoves: [move],
    );

    opoPokemon = opoPokemon;
    this.pokemon = myPokemon;
  }

  attack(
    PokemonCapModel pokemon,
    PokemonCapModel oPokemon,
    int index,
  ) async {
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
        await repository.getPokemonSpecies(pokemonModel.name);

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
          pokemonModel.moves![randomMoves].move.name,
        ),
      );
    }

    int randomLvl = random.nextInt(100);
    if (randomLvl == 0) randomLvl = 1;

    final PokemonCapModel poke = PokemonCapModel(
      pokemonModel: pokemonModel,
      pokemonSpeciesModel: pokemonSpeciesModel,
      ownedMoves: [],
      level: randomLvl,
      exp: 1656,
      expMax: 10000000,
    );

    poke.ownedMoves!.addAll(poke.pokemonModel!.completeMoves!);
    poke.pokemonModel!.moves!.clear();
    poke.pokemonModel!.completeMoves!.clear();

    return poke;
  }
}
