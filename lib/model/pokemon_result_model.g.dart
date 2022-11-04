// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      pokemonResult: (json['pokemonResult'] as List<dynamic>)
          .map((e) => PokemonResultModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: json['count'] as int,
      previous: json['previous'] as String,
      next: json['next'] as String,
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'pokemonResult': instance.pokemonResult,
      'count': instance.count,
      'previous': instance.previous,
      'next': instance.next,
    };

PokemonResultModel _$PokemonResultModelFromJson(Map<String, dynamic> json) =>
    PokemonResultModel(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$PokemonResultModelToJson(PokemonResultModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
