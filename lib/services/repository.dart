import 'package:pokedex_getx/constants/app_constants.dart';
import 'package:pokedex_getx/model/pokemon_model.dart';
import 'package:pokedex_getx/model/pokemon_result_model.dart';
import 'package:pokedex_getx/services/endpoints.dart';
import 'dart:convert';
import 'package:pokedex_getx/services/http_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Repository {
  final _httpManager = HttpManager();
  final Future<SharedPreferences> sharedPreferences =
      SharedPreferences.getInstance();

  Future<List<PokemonModel>> getSharedPokemon() async {
    final SharedPreferences prefs = await sharedPreferences;
    final String jsonString = prefs.getString(shared_pokemon_key) ?? '[]';
    final List jsonDecoded = json.decode(jsonString) as List;

    final pokemons = jsonDecoded.map((e) => PokemonModel.fromJson(e)).toList();

    return pokemons;
  }

  Future<void> deleteData() async {
    final SharedPreferences prefs = await sharedPreferences;
    await prefs.remove(shared_pokemon_key);
    await prefs.remove(shared_result_key);
  }

  Future<ResultModel> getSharedResult() async {
    final SharedPreferences prefs = await sharedPreferences;

    final ResultModel model = ResultModel(
      pokemonResult: [],
      count: 0,
      previous: null,
      next: null,
    );

    final String? jsonString = prefs.getString(shared_result_key);
    final teste = jsonString != null ? json.decode(jsonString) : model;
    return jsonString != null ? ResultModel.fromJson(teste) : model;
  }

  void updatePokemon(List<PokemonModel> pokemonList) async {
    final SharedPreferences prefs = await sharedPreferences;
    await prefs.remove(shared_pokemon_key);

    final jsonPokemon = json.encode(pokemonList);
    await prefs.setString(shared_pokemon_key, jsonPokemon);
  }

  void savePokemon(List<PokemonModel> pokemonList) async {
    final SharedPreferences prefs = await sharedPreferences;
    final jsonPokemon = json.encode(pokemonList);
    await prefs.setString(shared_pokemon_key, jsonPokemon);
  }

  void saveResult(ResultModel resultModel) async {
    final SharedPreferences prefs = await sharedPreferences;

    final jsonResult = json.encode(resultModel);
    prefs.setString(shared_result_key, jsonResult);
  }

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
