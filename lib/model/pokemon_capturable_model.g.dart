// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_capturable_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonSpeciesModel _$PokemonSpeciesModelFromJson(Map<String, dynamic> json) =>
    PokemonSpeciesModel(
      captureRate: json['capture_rate'] as int,
      evolutionChain: EvolutionChain.fromJson(
          json['evolution_chain'] as Map<String, dynamic>),
      growthRate:
          GrowthRate.fromJson(json['growth_rate'] as Map<String, dynamic>),
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
      url: json['url'] as String,
    );

Map<String, dynamic> _$EvolutionChainToJson(EvolutionChain instance) =>
    <String, dynamic>{
      'url': instance.url,
    };

GrowthRate _$GrowthRateFromJson(Map<String, dynamic> json) => GrowthRate(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$GrowthRateToJson(GrowthRate instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

GrowthRateResult _$GrowthRateResultFromJson(Map<String, dynamic> json) =>
    GrowthRateResult(
      name: json['name'] as String,
      formula: json['formula'] as String,
      levels: (json['levels'] as List<dynamic>)
          .map((e) => Levels.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GrowthRateResultToJson(GrowthRateResult instance) =>
    <String, dynamic>{
      'name': instance.name,
      'formula': instance.formula,
      'levels': instance.levels,
    };

Levels _$LevelsFromJson(Map<String, dynamic> json) => Levels(
      experience: json['experience'] as int,
      level: json['level'] as int,
    );

Map<String, dynamic> _$LevelsToJson(Levels instance) => <String, dynamic>{
      'experience': instance.experience,
      'level': instance.level,
    };
