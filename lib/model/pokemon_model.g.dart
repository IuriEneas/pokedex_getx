// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonModel _$PokemonModelFromJson(Map<String, dynamic> json) => PokemonModel(
      name: json['name'] as String,
      id: json['id'] as int,
      height: json['height'] as int,
      weight: json['weight'] as int,
      completeMoves: (json['completeMoves'] as List<dynamic>?)
          ?.map((e) => MoveModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      sprites: Sprites.fromJson(json['sprites'] as Map<String, dynamic>),
      types: (json['types'] as List<dynamic>)
          .map((e) => Types.fromJson(e as Map<String, dynamic>))
          .toList(),
      moves: (json['moves'] as List<dynamic>?)
              ?.map((e) => Moves.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      stats: (json['stats'] as List<dynamic>)
          .map((e) => Stats.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PokemonModelToJson(PokemonModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'height': instance.height,
      'weight': instance.weight,
      'completeMoves': {
        for (var e in instance.completeMoves!) e.type!.name: e.toJson()
      },
      'sprites': instance.sprites.toJson(),
      'types': {
        for (var e in instance.types)
          instance.types.indexOf(e).toString(): e.type.toJson()
      },
      'moves': {
        for (var e in instance.moves!)
          instance.moves!.indexOf(e).toString(): e.toJson()
      },
      'stats': {
        for (var e in instance.stats)
          instance.stats.indexOf(e).toString(): e.toJson()
      },
    };

Sprites _$SpritesFromJson(Map<String, dynamic> json) => Sprites(
      frontDefault: json['front_default'] as String? ??
          'https://assets.pokemon.com/assets/cms2/img/pokedex/full/132.png',
      other: Other.fromJson(json['other'] as Map<String, dynamic>),
    )..backDefault = json['back_default'] as String?;

Map<String, dynamic> _$SpritesToJson(Sprites instance) => <String, dynamic>{
      'front_default': instance.frontDefault,
      'back_default': instance.backDefault,
      'other': instance.other.toJson(),
    };

Other _$OtherFromJson(Map<String, dynamic> json) => Other(
      officialArtWork: OfficialArtWork.fromJson(
          json['official-artwork'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OtherToJson(Other instance) => <String, dynamic>{
      'official-artwork': instance.officialArtWork.toJson(),
    };

OfficialArtWork _$OfficialArtWorkFromJson(Map<String, dynamic> json) =>
    OfficialArtWork(
      frontDefault: json['front_default'] as String? ??
          'https://assets.pokemon.com/assets/cms2/img/pokedex/full/132.png',
    );

Map<String, dynamic> _$OfficialArtWorkToJson(OfficialArtWork instance) =>
    <String, dynamic>{
      'front_default': instance.frontDefault,
    };

Types _$TypesFromJson(Map<String, dynamic> json) => Types(
      type: Type.fromJson(json['type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TypesToJson(Types instance) => <String, dynamic>{
      'type': instance.type.toJson(),
    };

Type _$TypeFromJson(Map<String, dynamic> json) => Type(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$TypeToJson(Type instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

Moves _$MovesFromJson(Map<String, dynamic> json) => Moves(
      move: Move.fromJson(json['move'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MovesToJson(Moves instance) => <String, dynamic>{
      'move': instance.move.toJson(),
    };

Move _$MoveFromJson(Map<String, dynamic> json) => Move(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$MoveToJson(Move instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

Stats _$StatsFromJson(Map<String, dynamic> json) => Stats(
      baseStat: json['base_stat'] as int,
      effort: json['effort'] as int,
      stat: Stat.fromJson(json['stat'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StatsToJson(Stats instance) => <String, dynamic>{
      'base_stat': instance.baseStat,
      'effort': instance.effort,
      'stat': instance.stat.toJson(),
    };

Stat _$StatFromJson(Map<String, dynamic> json) => Stat(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$StatToJson(Stat instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
