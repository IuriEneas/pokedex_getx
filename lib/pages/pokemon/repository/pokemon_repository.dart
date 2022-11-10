import 'package:pokedex_getx/model/move_model.dart';
import 'package:pokedex_getx/services/endpoints.dart';
import 'package:pokedex_getx/services/http_manager.dart';

class PokemonRepository {
  final HttpManager _httpManager = HttpManager();

  Future<MoveModel> getMove(String name) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.moveEndpoint(name),
      method: HttpMethods.get,
    );

    final move = MoveModel.fromJson(result);

    return move;
  }

  Future<List<ResultMoveModel>> getAllMoves() async {
    final result = await _httpManager.restRequest(
      url: Endpoints.getAllPokemon,
      method: HttpMethods.get,
    );

    final List<ResultMoveModel> move = List.from(result['results'])
        .map((e) => ResultMoveModel.fromJson(e))
        .toList();

    return move;
  }
}
