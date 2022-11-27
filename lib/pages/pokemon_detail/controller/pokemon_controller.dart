import 'package:get/get.dart';
import 'package:pokedex_getx/model/move_model.dart';
import 'package:pokedex_getx/model/pokemon_model.dart';
import 'package:pokedex_getx/pages/base/controller/base_controller.dart';
import 'package:pokedex_getx/pages/pokemon_detail/repository/pokemon_repository.dart';
import 'package:pokedex_getx/services/repository.dart';

class PokemonController extends GetxController {
  bool isLoading = false;
  final respository = PokemonRepository();
  final baseRespository = Repository();
  final controller = Get.find<BaseController>();

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
    poke.completeMoves = [];

    //if (poke.moves == null) return;

    for (Moves it in poke.moves!) {
      poke.completeMoves?.add(await respository.getMove(it.move!.name!));

      if ((poke.completeMoves?.length)! % 10 == 0) {
        update();
        setLoading(false);
      }
    }
    controller.repository.savePokemon(controller.pokemonList);

    setLoading(false);
  }

  Future<void> test() async {
    final test = controller.resultModel?.next;

    print(test);
  }
}
