import 'package:get/get.dart';
import 'package:pokedex_getx/model/pokemon_model.dart';
import 'package:pokedex_getx/model/pokemon_result_model.dart';
import 'package:pokedex_getx/routes/page_routes.dart';
import 'package:pokedex_getx/services/repository.dart';

class BaseController extends GetxController {
  final Repository repository = Repository();

  List<PokemonResultModel> pokemonResult = [];
  List<PokemonModel> pokemonList = [];

  ResultModel? resultModel;

  @override
  void onInit() {
    super.onInit();
    getResult();
  }

  Future<void> getResult() async {
    final result = await repository.getPokemonResults();
    resultModel = await repository.getResult();

    pokemonResult = result;

    for (PokemonResultModel it in pokemonResult) {
      pokemonList.add(await getPokemon(it.name));
    }

    Get.offAllNamed(PagesRoute.baseRoute);

    update();
  }

  Future<PokemonModel> getPokemon(String name) async {
    final result = await repository.getPokemon(name);

    return result;
  }

  Future<void> getMorePokemon() async {
    resultModel = await repository.getResult(endpoint: resultModel?.next);

    final result = await repository.getPokemonResults(next: resultModel?.next);

    for (PokemonResultModel it in result) {
      pokemonList.add(await getPokemon(it.name));
    }

    update();
  }
}