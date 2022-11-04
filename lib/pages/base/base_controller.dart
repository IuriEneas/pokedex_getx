import 'package:get/get.dart';
import 'package:pokedex_getx/model/pokemon_model.dart';
import 'package:pokedex_getx/model/pokemon_result_model.dart';
import 'package:pokedex_getx/services/repository.dart';

class BaseController extends GetxController {
  final Repository repository = Repository();

  List<PokemonResultModel> pokemonResult = [];
  List<PokemonModel> pokemonList = [];

  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
    getResult();
  }

  Future<void> getResult() async {
    isLoading = true;
    update();

    final result = await repository.getPokemonResults();
    pokemonResult = result;

    for (PokemonResultModel it in pokemonResult) {
      pokemonList.add(await getPokemon(it.name));
    }

    isLoading = false;
    update();
  }

  Future<PokemonModel> getPokemon(String name) async {
    final result = await repository.getPokemon(name);

    return result;
  }
}
