import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pokedex_getx/model/move_model.dart';
import 'package:pokedex_getx/model/pokemon_model.dart';

import '../model/pokemon_capturable_model.dart';

abstract class PokemonHelper {
  static PokemonCapModel convert(DocumentSnapshot snapshot) {
    final id = snapshot['pokemonModel']['id'];
    final name = snapshot['pokemonModel']['name'];
    final height = snapshot['pokemonModel']['height'];
    final weight = snapshot['pokemonModel']['weight'];
    final sprites = snapshot['pokemonModel']['sprites'];
    final species = snapshot['pokemonModel']['species'];

    List<Types> types = [];
    for (var i = 0; i < 2; i++) {
      if (snapshot['pokemonModel']['types'][i.toString()] != null) {
        types.add(
            Types.fromJson(snapshot['pokemonModel']['types'][i.toString()]));
      }
    }

    List<Stats> stats = [];
    for (var i = 0; i < 6; i++) {
      var stat = snapshot['pokemonModel']['stats'][i.toString()];
      if (stat != null) {
        stats.add(Stats.fromJson(stat));
      }
    }

    final pokeModel = PokemonModel(
      id: id,
      name: name,
      height: height,
      weight: weight,
      sprites: Sprites.fromJson(sprites),
      types: types,
      stats: stats,
      species: Species.fromJson(species),
      completeMoves: [],
      moves: [],
    );

    List<MoveModel> ownedMoves = [];
    for (var i = 0; i < 4; i++) {
      var a = snapshot['ownedMoves'][i.toString()];
      if (a != null) {
        ownedMoves.add(MoveModel.fromJson(a));
      }
    }

    final speciesModel = PokemonSpeciesModel(
      captureRate: snapshot['pokemonSpeciesModel']['captureRate'],
      evolutionChain: EvolutionChain.fromJson(
          snapshot['pokemonSpeciesModel']['evolutionChain']),
      growthRate:
          GrowthRate.fromJson(snapshot['pokemonSpeciesModel']['growthRate']),
    );

    final poke = PokemonCapModel(
      hp: snapshot['hp'],
      hpEv: snapshot['hpEv'],
      hpIv: snapshot['hpIv'],
      attack: snapshot['attack'],
      attackEv: snapshot['attackEv'],
      attackIv: snapshot['attackIv'],
      defense: snapshot['defense'],
      defenseEv: snapshot['defenseEv'],
      defenseIv: snapshot['defenseIv'],
      spAttack: snapshot['spAttack'],
      spAttackEv: snapshot['spAttackEv'],
      spAttackIv: snapshot['spAttackIv'],
      spDefense: snapshot['spDefense'],
      spDefenseEv: snapshot['spDefenseEv'],
      spDefenseIv: snapshot['spDefenseIv'],
      speed: snapshot['speed'],
      speedEv: snapshot['speedEv'],
      speedIv: snapshot['speedIv'],
      pokemonModel: pokeModel,
      pokemonSpeciesModel: speciesModel,
      ownedMoves: ownedMoves,
      level: snapshot['level'],
      exp: snapshot['exp'],
      expMax: snapshot['expMax'],
    );

    return poke;
  }
}
