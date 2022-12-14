// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_capturable_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonCapModel _$PokemonCapModelFromJson(Map<String, dynamic> json) =>
    PokemonCapModel(
      pokemonModel: json['pokemonModel'] == null
          ? null
          : PokemonModel.fromJson(json['pokemonModel'] as Map<String, dynamic>),
      pokemonSpeciesModel: json['pokemonSpeciesModel'] == null
          ? null
          : PokemonSpeciesModel.fromJson(
              json['pokemonSpeciesModel'] as Map<String, dynamic>),
      ownedMoves: (json['ownedMoves'] as List<dynamic>?)
          ?.map((e) => MoveModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      level: json['level'] as int?,
      exp: json['exp'] as int?,
      expMax: json['expMax'] as int?,
      hp: json['hp'] as int? ?? 0,
      attack: json['attack'] as int? ?? 0,
      defense: json['defense'] as int? ?? 0,
      spAttack: json['spAttack'] as int? ?? 0,
      spDefense: json['spDefense'] as int? ?? 0,
      speed: json['speed'] as int? ?? 0,
      hpEv: json['hpEv'] as int? ?? 0,
      attackEv: json['attackEv'] as int? ?? 0,
      defenseEv: json['defenseEv'] as int? ?? 0,
      spAttackEv: json['spAttackEv'] as int? ?? 0,
      spDefenseEv: json['spDefenseEv'] as int? ?? 0,
      speedEv: json['speedEv'] as int? ?? 0,
      hpIv: json['hpIv'] as int? ?? 0,
      attackIv: json['attackIv'] as int? ?? 0,
      defenseIv: json['defenseIv'] as int? ?? 0,
      spAttackIv: json['spAttackIv'] as int? ?? 0,
      spDefenseIv: json['spDefenseIv'] as int? ?? 0,
      speedIv: json['speedIv'] as int? ?? 0,
    )
      ..id = json['id'] as String?
      ..damageTaken = json['damageTaken'] as int
      ..isAlive = json['isAlive'] as bool;

Map<String, dynamic> _$PokemonCapModelToJson(PokemonCapModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'pokemonModel': instance.pokemonModel,
      'pokemonSpeciesModel': instance.pokemonSpeciesModel,
      'ownedMoves': instance.ownedMoves,
      'level': instance.level,
      'exp': instance.exp,
      'expMax': instance.expMax,
      'damageTaken': instance.damageTaken,
      'hp': instance.hp,
      'attack': instance.attack,
      'defense': instance.defense,
      'spAttack': instance.spAttack,
      'spDefense': instance.spDefense,
      'speed': instance.speed,
      'hpEv': instance.hpEv,
      'attackEv': instance.attackEv,
      'defenseEv': instance.defenseEv,
      'spAttackEv': instance.spAttackEv,
      'spDefenseEv': instance.spDefenseEv,
      'speedEv': instance.speedEv,
      'hpIv': instance.hpIv,
      'attackIv': instance.attackIv,
      'defenseIv': instance.defenseIv,
      'spAttackIv': instance.spAttackIv,
      'spDefenseIv': instance.spDefenseIv,
      'speedIv': instance.speedIv,
      'isAlive': instance.isAlive,
    };

PokemonSpeciesModel _$PokemonSpeciesModelFromJson(Map<String, dynamic> json) =>
    PokemonSpeciesModel(
      captureRate: json['capture_rate'] as int?,
      evolutionChain: json['evolution_chain'] == null
          ? null
          : EvolutionChain.fromJson(
              json['evolution_chain'] as Map<String, dynamic>),
      growthRate: json['growth_rate'] == null
          ? null
          : GrowthRate.fromJson(json['growth_rate'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonSpeciesModelToJson(
        PokemonSpeciesModel instance) =>
    <String, dynamic>{
      'capture_rate': instance.captureRate,
      'evolution_chain': instance.evolutionChain,
      'growth_rate': instance.growthRate,
    };

EvolutionChain _$EvolutionChainFromJson(Map<String, dynamic> json) =>
    EvolutionChain(
      url: json['url'] as String?,
    );

Map<String, dynamic> _$EvolutionChainToJson(EvolutionChain instance) =>
    <String, dynamic>{
      'url': instance.url,
    };

GrowthRate _$GrowthRateFromJson(Map<String, dynamic> json) => GrowthRate(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$GrowthRateToJson(GrowthRate instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

GrowthRateResult _$GrowthRateResultFromJson(Map<String, dynamic> json) =>
    GrowthRateResult(
      name: json['name'] as String?,
      formula: json['formula'] as String?,
      levels: (json['levels'] as List<dynamic>?)
          ?.map((e) => Levels.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GrowthRateResultToJson(GrowthRateResult instance) =>
    <String, dynamic>{
      'name': instance.name,
      'formula': instance.formula,
      'levels': instance.levels,
    };

Levels _$LevelsFromJson(Map<String, dynamic> json) => Levels(
      experience: json['experience'] as int?,
      level: json['level'] as int?,
    );

Map<String, dynamic> _$LevelsToJson(Levels instance) => <String, dynamic>{
      'experience': instance.experience,
      'level': instance.level,
    };
