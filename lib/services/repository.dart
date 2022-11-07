import 'package:pokedex_getx/model/pokemon_model.dart';
import 'package:pokedex_getx/model/pokemon_result_model.dart';
import 'package:pokedex_getx/services/endpoints.dart';
import 'package:pokedex_getx/services/http_manager.dart';

class Repository {
  final _httpManager = HttpManager();

  Future<List<PokemonResultModel>> getPokemonResults({String? next}) async {
    final result = await _httpManager.restRequest(
      url: next ?? Endpoints.resultPokemon,
      method: HttpMethods.get,
    );

    List<PokemonResultModel> resultadoEsperado =
        List<Map<String, dynamic>>.from(result['results'])
            .map((e) => PokemonResultModel.fromJson(e))
            .toList();

    return resultadoEsperado;
  }

  Future<ResultModel> getResult({String? endpoint}) async {
    final result = await _httpManager.restRequest(
      url: endpoint ?? Endpoints.resultPokemon,
      method: HttpMethods.get,
    );

    ResultModel data = ResultModel.fromJson(result);
    print(data.next);
    return data;
  }

  Future<PokemonModel> getPokemon(String name) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.pokemonEndpoint(name),
      method: HttpMethods.get,
    );

    PokemonModel pokemon = PokemonModel.fromJson(result);

    return pokemon;
  }
}
