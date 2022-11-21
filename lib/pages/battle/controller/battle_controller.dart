// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';
import 'package:pokedex_getx/model/pokemon_model.dart';
import 'package:pokedex_getx/pages/base/controller/base_controller.dart';
import 'package:pokedex_getx/pages/battle/repository/pokemon_cap_repository.dart';

import '../../../model/pokemon_capturable_model.dart';

class BattleController extends GetxController {
  final controller = Get.find<BaseController>();
  final repository = PokemonCapRepository();
  PokemonCapModel? pokemon;
  PokemonCapModel? opoPokemon;

  @override
  void onInit() {
    getPokemon(controller.pokemonList[4], controller.pokemonList[149]);
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
      ownedMoves: [pokemon.completeMoves![0]],
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
      ownedMoves: [],
    );

    opoPokemon = opoPokemon;
    this.pokemon = myPokemon;
  }

  attack(int index) {
    final damageDelt = (pokemon?.ownedMoves[0].power)! / 10;
    update();
  }

  double dealDamage(double damageTaken, double damageDelt) {
    return damageTaken + damageDelt;
  }
}
