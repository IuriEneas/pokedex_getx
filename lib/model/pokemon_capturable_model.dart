// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:pokedex_getx/model/move_model.dart';
import 'package:pokedex_getx/model/pokemon_model.dart';

part 'pokemon_capturable_model.g.dart';

@JsonSerializable()
class PokemonCapModel {
  String? id;
  PokemonModel? pokemonModel;
  PokemonSpeciesModel? pokemonSpeciesModel;
  List<MoveModel>? ownedMoves;
  int? level;
  int? exp;
  int? expMax;

  int damageTaken = 0;

  int hp = 0;
  int attack = 0;
  int defense = 0;
  int spAttack = 0;
  int spDefense = 0;
  int speed = 0;

  int hpEv = 0;
  int attackEv = 0;
  int defenseEv = 0;
  int spAttackEv = 0;
  int spDefenseEv = 0;
  int speedEv = 0;

  int hpIv = 0;
  int attackIv = 0;
  int defenseIv = 0;
  int spAttackIv = 0;
  int spDefenseIv = 0;
  int speedIv = 0;

  bool isAlive = true;

  final Random random = Random();

  PokemonCapModel({
    required this.pokemonModel,
    required this.pokemonSpeciesModel,
    required this.ownedMoves,
    required this.level,
    required this.exp,
    required this.expMax,
    this.isAlive = true,
    this.damageTaken = 0,
    this.hp = 0,
    this.attack = 0,
    this.defense = 0,
    this.spAttack = 0,
    this.spDefense = 0,
    this.speed = 0,
    this.hpEv = 0,
    this.attackEv = 0,
    this.defenseEv = 0,
    this.spAttackEv = 0,
    this.spDefenseEv = 0,
    this.speedEv = 0,
    this.hpIv = 0,
    this.attackIv = 0,
    this.defenseIv = 0,
    this.spAttackIv = 0,
    this.spDefenseIv = 0,
    this.speedIv = 0,
  }) {
    Random random = Random();

    if (hp == 0) {
      hpEv = pokemonModel!.stats![0].effort!;
      attackEv = pokemonModel!.stats![1].effort!;
      defenseEv = pokemonModel!.stats![2].effort!;
      spAttackEv = pokemonModel!.stats![3].effort!;
      defenseEv = pokemonModel!.stats![4].effort!;
      spAttackEv = pokemonModel!.stats![5].effort!;

      hpIv = random.nextInt(31);
      attackIv = random.nextInt(31);
      defenseIv = random.nextInt(31);
      spAttackIv = random.nextInt(31);
      spDefenseIv = random.nextInt(31);
      speedIv = random.nextInt(31);

      hp = getStat(
        ev: hpEv,
        iv: hpIv,
        stat: pokemonModel!.stats![0].baseStat!,
        statName: pokemonModel!.stats![0].stat!.name!,
      );

      attack = getStat(
        ev: attackEv,
        iv: attackIv,
        stat: pokemonModel!.stats![1].baseStat!,
        statName: pokemonModel!.stats![1].stat!.name!,
      );

      defense = getStat(
        ev: defenseEv,
        iv: defenseIv,
        stat: pokemonModel!.stats![2].baseStat!,
        statName: pokemonModel!.stats![2].stat!.name!,
      );

      spAttack = getStat(
        ev: spAttackEv,
        iv: spAttackIv,
        stat: pokemonModel!.stats![3].baseStat!,
        statName: pokemonModel!.stats![3].stat!.name!,
      );

      spDefense = getStat(
        ev: spDefenseEv,
        iv: spDefenseIv,
        stat: pokemonModel!.stats![4].baseStat!,
        statName: pokemonModel!.stats![4].stat!.name!,
      );

      speed = getStat(
        ev: speedEv,
        iv: speedIv,
        stat: pokemonModel!.stats![5].baseStat!,
        statName: pokemonModel!.stats![5].stat!.name!,
      );
    }
  }

  int getStat(
      {required int stat,
      required int ev,
      required int iv,
      required String statName}) {
    final int value;

    if (statName == 'hp') {
      value = (0.01 * (2 * stat + iv + (0.25 * ev).floor()) * level!).floor() +
          level! +
          10;
    } else {
      value =
          (0.01 * (2 * stat + iv + (0.25 * ev).floor()) * level!).floor() + 5;
    }

    return value;
  }

  double get percentDamage {
    if (damageTaken > hp) {
      damageTaken = hp;
    }

    double total = damageTaken * 100 / hp;
    return total;
  }

  double get percentExp {
    double total = exp! * 100 / expMax!;
    return total;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'pokemonModel': pokemonModel?.toMap(),
      'pokemonSpeciesModel': pokemonSpeciesModel?.toMap(),
      'ownedMoves': {
        for (var e in ownedMoves!) ownedMoves!.indexOf(e).toString(): e.toMap()
      },
      'level': level,
      'exp': exp,
      'expMax': expMax,
      'damageTaken': damageTaken,
      'hp': hp,
      'attack': attack,
      'defense': defense,
      'spDefense': spDefense,
      'spAttack': spAttack,
      'speed': speed,
      'hpEv': hpEv,
      'attackEv': attackEv,
      'defenseEv': defenseEv,
      'spAttackEv': spAttackEv,
      'spDefenseEv': spDefenseEv,
      'speedEv': speedEv,
      'hpIv': hpIv,
      'attackIv': attackIv,
      'defenseIv': defenseIv,
      'spAttackIv': spAttackIv,
      'spDefenseIv': spDefenseIv,
      'speedIv': speedIv,
      'isAlive': isAlive,
    };
  }

  PokemonCapModel.fromDocument(DocumentSnapshot? document) {
    id = document?.id;
    pokemonModel = PokemonModel.fromJson(document?['pokemonModel']);
    pokemonSpeciesModel =
        PokemonSpeciesModel.fromDocument(document?['pokemonSpeciesModel']);
    ownedMoves =
        MoveModel.fromDocument(document?['ownedMoves']) as List<MoveModel>?;
    level = document?['level'];
    exp = document?['exp'];
    expMax = document?['expMax'];
    damageTaken = document?['damageTaken'];
    hp = document?['hp'];
    attack = document?['attack'];
    defense = document?['defense'];
    spAttack = document?['spAttack'];
    speed = document?['speed'];
    hpEv = document?['hpEv'];
    attackEv = document?['attackEv'];
    defenseEv = document?['defenseEv'];
    spAttackEv = document?['spAttackEv'];
    spDefenseEv = document?['spDefenseEv'];
    speedEv = document?['speedEv'];
    hpIv = document?['hpIv'];
    attackIv = document?['attackIv'];
    defenseIv = document?['defenseIv'];
    spAttackIv = document?['spAttackIv'];
    spDefenseIv = document?['spDefenseIv'];
    speedIv = document?['speedIv'];
    isAlive = document?['isAlive'];
  }

  factory PokemonCapModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonCapModelFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonCapModelToJson(this);
}

@JsonSerializable()
class PokemonSpeciesModel {
  @JsonKey(name: 'capture_rate')
  int? captureRate;

  @JsonKey(name: 'evolution_chain')
  EvolutionChain? evolutionChain;

  @JsonKey(name: 'growth_rate')
  GrowthRate? growthRate;

  PokemonSpeciesModel({
    required this.captureRate,
    required this.evolutionChain,
    required this.growthRate,
  });

  Map<String, dynamic> toMap() {
    return {
      'captureRate': captureRate,
      'evolutionChain': evolutionChain!.toMap(),
      'growthRate': growthRate!.toMap(),
    };
  }

  PokemonSpeciesModel.fromDocument(DocumentSnapshot document) {
    captureRate = document['captureRate'];
    evolutionChain = EvolutionChain.fromDocument(document['evolutionChain']);
    growthRate = GrowthRate.fromDocument(document['growthRate']);
  }

  factory PokemonSpeciesModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonSpeciesModelFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonSpeciesModelToJson(this);

  @override
  String toString() =>
      'PokemonSpeciesModel(captureRate: $captureRate, evolutionChain: $evolutionChain, growthRate: $growthRate)';
}

@JsonSerializable()
class EvolutionChain {
  String? url;

  EvolutionChain({
    required this.url,
  });

  Map<String, dynamic> toMap() {
    return {
      'url': url,
    };
  }

  EvolutionChain.fromDocument(DocumentSnapshot document) {
    url = document['url'];
  }

  factory EvolutionChain.fromJson(Map<String, dynamic> json) =>
      _$EvolutionChainFromJson(json);

  Map<String, dynamic> toJson() => _$EvolutionChainToJson(this);
}

@JsonSerializable()
class GrowthRate {
  String? name;
  String? url;

  GrowthRate({
    required this.name,
    required this.url,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
    };
  }

  GrowthRate.fromDocument(DocumentSnapshot document) {
    name = document['name'];
    url = document['url'];
  }

  factory GrowthRate.fromJson(Map<String, dynamic> json) =>
      _$GrowthRateFromJson(json);

  Map<String, dynamic> toJson() => _$GrowthRateToJson(this);
}

@JsonSerializable()
class GrowthRateResult {
  String? name;
  String? formula;
  List<Levels>? levels;

  GrowthRateResult({
    required this.name,
    required this.formula,
    required this.levels,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'formula': formula,
      'levels': {
        for (var e in levels!) levels!.indexOf(e).toString(): e.toMap()
      }
    };
  }

  GrowthRateResult.fromDocument(DocumentSnapshot document) {
    name = document['name'];
    formula = document['formula'];
    levels = Levels.fromDocument(document['levels']) as List<Levels>?;
  }

  factory GrowthRateResult.fromJson(Map<String, dynamic> json) =>
      _$GrowthRateResultFromJson(json);

  Map<String, dynamic> toJson() => _$GrowthRateResultToJson(this);
}

@JsonSerializable()
class Levels {
  int? experience;
  int? level;

  Levels({
    required this.experience,
    required this.level,
  });

  Map<String, dynamic> toMap() {
    return {
      'experience': experience,
      'level': level,
    };
  }

  Levels.fromDocument(DocumentSnapshot document) {
    experience = document['experience'];
    level = document['level'];
  }

  factory Levels.fromJson(Map<String, dynamic> json) => _$LevelsFromJson(json);
  Map<String, dynamic> toJson() => _$LevelsToJson(this);
}
