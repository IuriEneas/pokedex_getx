import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:pokedex_getx/model/move_model.dart';
import 'package:pokedex_getx/model/pokemon_model.dart';
import 'package:pokedex_getx/pages/base/controller/base_controller.dart';
import 'package:pokedex_getx/pages/battle/repository/pokemon_cap_repository.dart';
import 'package:pokedex_getx/pages/pokemon_detail/repository/pokemon_repository.dart';
import 'package:pokedex_getx/services/helper.dart';

import '../../../model/pokemon_capturable_model.dart';
import '../../../routes/page_routes.dart';

class BattleController extends GetxController {
  final controller = Get.find<BaseController>();
  final repository = PokemonCapRepository();
  final pokemonRepository = PokemonRepository();
  late PokemonCapModel pokemon;
  PokemonCapModel? opoPokemon;
  bool isGridviewVisible = true;

  List<DocumentSnapshot> myPokemonList = [];

  final CollectionReference pokemonRef =
      FirebaseFirestore.instance.collection('myPokemon');

  late DocumentSnapshot documentSnapshot;
  late QuerySnapshot querySnapshot;

  @override
  void onInit() async {
    await randomPokemon();
    await myPokemon();
    super.onInit();
  }

  myPokemon() {
    myPokemonList = querySnapshot.docs;
  }

  randomPokemon() async {
    querySnapshot = await pokemonRef.get();
    opoPokemon = await notificationPokemon();

    if (isFirstPokemon()) {
      pokemon = await createPokemon(controller.pokemonList.first);
      savePokemon(pokemon);
    }

    if (querySnapshot.docs.isNotEmpty) {
      documentSnapshot = querySnapshot.docs[0];
      pokemon = PokemonHelper.convert(documentSnapshot);
    }
  }

  attack(PokemonCapModel pokemon, PokemonCapModel oPokemon, int index) async {
    if (pokemon.isAlive) {
      int i = pokemon.ownedMoves![index].power!;

      oPokemon.damageTaken +=
          ((i * opoPokemon!.hp) / 100 - opoPokemon!.defense).toInt();

      if (oPokemon.damageTaken >= oPokemon.hp) {
        oPokemon.isAlive = false;
      }

      update();
    }
    await Future.delayed(const Duration(seconds: 1));

    if (oPokemon.isAlive) {
      pokemon.damageTaken += oPokemon.ownedMoves![0].power as int;

      if (pokemon.damageTaken == pokemon.hp) {
        pokemon.isAlive = false;
      }
    }

    update();
  }

  double dealDamage(double damageTaken, double damageDelt) {
    return damageTaken + damageDelt;
  }

  Future<PokemonCapModel> notificationPokemon() async {
    Random r = Random();
    int randomPoke;

    do {
      randomPoke = r.nextInt(controller.pokemonList.length - 1);
    } while (controller.pokemonList[randomPoke].id! > 10000);

    final pokemonModel = controller.pokemonList[randomPoke];

    return await createPokemon(pokemonModel);
  }

  Future<PokemonCapModel> createPokemon(PokemonModel pokemonModel) async {
    final pokemonSpeciesModel =
        await repository.getPokemonSpecies(pokemonModel.species!.url!);

    pokemonModel.completeMoves = [];
    final random = Random();
    int num = random.nextInt(5);
    final moveNum = pokemonModel.moves!.length;

    if (num == 0) num = 1;

    for (var i = 1; i <= num; i++) {
      int randomMoves = random.nextInt(moveNum);

      _verificationMove(pokemonModel, moveNum)
          ? pokemonModel.completeMoves?.add(
              await pokemonRepository.getMove(
                pokemonModel.moves![randomMoves].move!.name!,
              ),
            )
          : i - 1;
    }

    final growth = await repository
        .getPokemonGrowth(pokemonSpeciesModel.growthRate!.name!);

    final level = isFirstPokemon() ? 5 : pokemonLvlProbability(lvl: media());

    final PokemonCapModel poke = PokemonCapModel(
      pokemonModel: pokemonModel,
      pokemonSpeciesModel: pokemonSpeciesModel,
      ownedMoves: [],
      level: level,
      exp: 0,
      expMax: growth.levels![level].experience,
    );

    poke.ownedMoves!.addAll(poke.pokemonModel!.completeMoves!);
    poke.pokemonModel!.moves!.clear();
    poke.pokemonModel!.completeMoves!.clear();

    return poke;
  }

  bool _verificationMove(PokemonModel pokemonModel, int moveNumber) {
    for (MoveModel move in pokemonModel.completeMoves!) {
      if (move.name!
          .contains(pokemonModel.moves![moveNumber - 1].move!.name!)) {
        return false;
      }
    }

    return true;
  }

  int media() {
    int value = 0;

    for (DocumentSnapshot a in querySnapshot.docs) {
      value += a['level'] as int;
    }

    return (value / querySnapshot.docs.length).ceil();
  }

  int pokemonLvlProbability({required int lvl}) {
    int total;
    Random random = Random();
    double n = random.nextDouble();

    if (lvl < 16) {
      total = ((n * lvl) / 2).floor() + lvl;
    } else if (lvl < 32) {
      total = ((n * lvl) / 3).floor() + lvl;
    } else if (lvl < 64) {
      total = ((n * lvl) / 4).floor() + lvl;
    } else {
      total = ((n * lvl) / 5).floor() + lvl;
    }

    if (total > 99) {
      total = 99;
    } else if (total <= 0) {
      total = 1;
    }

    return total;
  }

  bool isFirstPokemon() {
    if (querySnapshot.docs.isEmpty) return true;
    return false;
  }

  void gridViewVisibility() {
    isGridviewVisible ? isGridviewVisible = false : isGridviewVisible = true;
    update();
  }

  void choosePokemon() async {
    final result = await Get.toNamed(PagesRoute.selectPokemonRoute);

    pokemon = result ?? pokemon;
    update();
  }

  void capturePokemon(double captureRate, PokemonCapModel pokemonCapModel) {
    Random random = Random();

    List<double> chances = [captureRate];
    bool dropped = false;
    double n = random.nextDouble() * 100;

    for (int i = 0; i < chances.length; i++) {
      if (chances[i] >= n) {
        print("Capturou o pokemon com ${chances[i]}% de chance ($n)");
        savePokemon(pokemonCapModel);
        dropped = true;
        break;
      }
    }
    if (dropped == false) {
      print("Não capturou");
    }
  }

  void savePokemon(PokemonCapModel pokemon) async {
    await pokemonRef.doc().set(pokemon.toMap());
    Get.back();
  }

  void choosePokeball() async {
    final result = await Get.toNamed(PagesRoute.selectItemRoute);
    if (result != null) {
      capturePokemon(result.captureRate + .0, opoPokemon!);
    }
    update();
  }
}
