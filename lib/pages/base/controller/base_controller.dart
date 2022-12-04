import 'dart:math';

import 'package:get/get.dart';
import 'package:pokedex_getx/model/pokemon_model.dart';
import 'package:pokedex_getx/model/pokemon_result_model.dart';
import 'package:pokedex_getx/routes/page_routes.dart';
import 'package:pokedex_getx/services/repository.dart';

class BaseController extends GetxController {
  final Repository repository = Repository();

  RxInt currentIndex = 0.obs;

  List<PokemonResultModel> pokemonResult = [];
  List<PokemonModel> pokemonList = [];
  List<PokemonModel> queryList = [];

  ResultModel? resultModel;

  @override
  void onInit() async {
    super.onInit();
    getResult();
  }

  Future<void> getResult() async {
    final result = await repository.getPokemonResults();
    resultModel = await repository.getResult();

    pokemonResult = result;

    if (!await getSharedPreferences()) {
      for (PokemonResultModel it in pokemonResult) {
        pokemonList.add(await getPokemon(it.name));
      }

      repository.savePokemon(pokemonList);
      repository.saveResult(resultModel!);
    }

    Get.offAllNamed(PagesRoute.baseRoute);

    update();
  }

  Future<PokemonModel> getPokemon(String name) async {
    final result = await repository.getPokemon(name);
    return result;
  }

  Future<bool> getSharedPreferences() async {
    final pokemons = await repository.getSharedPokemon();
    final result = await repository.getSharedResult();

    if (pokemons.isEmpty) return false;

    pokemonList = pokemons;
    resultModel = result;

    return true;
  }

  Future<void> getMorePokemon() async {
    final result = await repository.getPokemonResults(next: resultModel?.next);

    if (resultModel?.next == null) return;

    for (PokemonResultModel it in result) {
      final pokemon = await getPokemon(it.name);

      if (pokemonList.last.name == it.name) return;
      pokemonList.add(pokemon);
    }

    pokemonList.sort(
      (a, b) => a.id!.compareTo(b.id!),
    );

    resultModel = await repository.getResult(endpoint: resultModel?.next);

    repository.savePokemon(pokemonList);
    repository.saveResult(resultModel!);

    update();
  }

  deleteShared() {
    repository.deleteData();
  }

  Future<PokemonModel> getRandomPokemon() async {
    final random = Random();
    int randomInt = random.nextInt(pokemonList.length);
    final pokemon = pokemonList[randomInt];

    return pokemon;
  }

  Future<List<PokemonModel>?> searchPokemon(String query) async {
    queryList.clear();

    _searchByName(query);
    _searchByType(query);
    _searchById(query);

    update();

    return queryList;
  }

  _searchByName(String query) {
    for (PokemonModel it in pokemonList) {
      if (it.name!.contains(query)) {
        queryList.add(it);
      }
    }
  }

  _searchById(String query) {
    for (PokemonModel it in pokemonList) {
      if (it.id.toString().contains(query)) {
        queryList.add(it);
      }
    }
  }

  _searchByType(String query) {
    for (PokemonModel it in pokemonList) {
      if (it.types![0].type!.name!.contains(query)) {
        if (!it.name!.contains(query)) {
          queryList.add(it);
        }
      } else {
        if (it.types!.length > 1) {
          if (it.types![1].type!.name!.contains(query)) {
            if (!it.name!.contains(query)) {
              queryList.add(it);
            }
          }
        }
      }
    }
  }
}
