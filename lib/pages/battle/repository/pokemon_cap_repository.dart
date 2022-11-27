import 'package:pokedex_getx/model/pokemon_capturable_model.dart';
import 'package:pokedex_getx/services/endpoints.dart';
import 'package:pokedex_getx/services/http_manager.dart';

class PokemonCapRepository {
  final HttpManager _httpManager = HttpManager();

  Future<PokemonSpeciesModel> getPokemonSpecies(String name) async {
    final result = await _httpManager.restRequest(
      url: name,
      method: HttpMethods.get,
    );

    final PokemonSpeciesModel pokemon = PokemonSpeciesModel.fromJson(result);

    return pokemon;
  }

  Future<GrowthRateResult> getPokemonGrowth(String growthName) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.pokemonGrowthRateEndpoint(growthName),
      method: HttpMethods.get,
    );

    final GrowthRateResult growth = GrowthRateResult.fromJson(result);

    return growth;
  }
}
