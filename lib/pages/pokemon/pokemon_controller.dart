import 'package:get/get.dart';
import 'package:pokedex_getx/model/move_model.dart';
import 'package:pokedex_getx/model/pokemon_model.dart';
import 'package:pokedex_getx/pages/pokemon/repository/pokemon_repository.dart';

class PokemonController extends GetxController {
  bool isLoading = false;
  final respository = PokemonRepository();
  List<MoveModel> moveList = [];

  setLoading(bool value) {
    isLoading = value;
    update();
  }

  Future<void> getAllMoves() async {
    final result = await respository.getAllMoves();
  }

  Future<void> loadMoves(PokemonModel poke) async {
    setLoading(true);

    if (poke.moves == null) return;

    for (Moves it in poke.moves!) {
      poke.completeMoves!.add(await respository.getMove(it.move.name));
      print(poke.completeMoves!.length);

      if (poke.completeMoves!.length > 18) {
        update();
        setLoading(false);
      }
    }
  }
}
