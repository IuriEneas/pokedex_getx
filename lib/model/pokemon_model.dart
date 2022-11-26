// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

import 'move_model.dart';

part 'pokemon_model.g.dart';

@JsonSerializable()
class PokemonModel {
  String name;
  @JsonKey(name: 'id')
  int id;
  int height;
  int weight;

  List<MoveModel>? completeMoves = [];

  @JsonKey(name: 'sprites')
  Sprites sprites;

  List<Types> types;
  List<Moves>? moves;

  List<Stats> stats;

  PokemonModel({
    required this.id,
    required this.name,
    required this.height,
    required this.weight,
    this.completeMoves,
    required this.sprites,
    required this.types,
    this.moves = const [],
    required this.stats,
  });

  String get realName {
    final formattedName = name.replaceFirst(name[0], name[0].toUpperCase());
    return formattedName.replaceAll('-', ' ');
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
      'height': height,
      'completeMoves': {
        for (var e in completeMoves!)
          completeMoves!.indexOf(e).toString(): e.toMap()
      },
      'sprites': sprites.toMap(),
      'types': {for (var e in types) types.indexOf(e).toString(): e.toMap()},
      'moves': {for (var e in moves!) moves!.indexOf(e).toString(): e.toMap()},
      'stats': {for (var e in stats) stats.indexOf(e).toString(): e.toMap()},
    };
  }

  factory PokemonModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonModelFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonModelToJson(this);
}

@JsonSerializable()
class Sprites {
  @JsonKey(name: 'front_default')
  String? frontDefault;
  @JsonKey(name: 'back_default')
  String? backDefault;
  Other other;

  Sprites({
    this.frontDefault =
        'https://assets.pokemon.com/assets/cms2/img/pokedex/full/132.png',
    required this.other,
  });

  Map<String, dynamic> toMap() {
    return {
      'frontDefault': frontDefault,
      'backDefault': backDefault,
      'other': other.toMap(),
    };
  }

  factory Sprites.fromJson(Map<String, dynamic> json) =>
      _$SpritesFromJson(json);

  Map<String, dynamic> toJson() => _$SpritesToJson(this);
}

@JsonSerializable()
class Other {
  @JsonKey(name: 'official-artwork')
  OfficialArtWork officialArtWork;

  Other({
    required this.officialArtWork,
  });

  Map<String, dynamic> toMap() {
    return {
      'officialArtWork': officialArtWork.toMap(),
    };
  }

  factory Other.fromJson(Map<String, dynamic> json) => _$OtherFromJson(json);

  Map<String, dynamic> toJson() => _$OtherToJson(this);
}

@JsonSerializable()
class OfficialArtWork {
  @JsonKey(name: 'front_default')
  String? frontDefault;

  OfficialArtWork({
    this.frontDefault =
        'https://assets.pokemon.com/assets/cms2/img/pokedex/full/132.png',
  });

  Map<String, dynamic> toMap() {
    return {
      'frontDefault': frontDefault,
    };
  }

  factory OfficialArtWork.fromJson(Map<String, dynamic> json) =>
      _$OfficialArtWorkFromJson(json);

  Map<String, dynamic> toJson() => _$OfficialArtWorkToJson(this);
}

@JsonSerializable()
class Types {
  Type type;
  Types({
    required this.type,
  });

  Map<String, dynamic> toMap() {
    return {
      'type': type.toMap(),
    };
  }

  factory Types.fromJson(Map<String, dynamic> json) => _$TypesFromJson(json);

  Map<String, dynamic> toJson() => _$TypesToJson(this);
}

@JsonSerializable()
class Type {
  String name;
  String url;

  Type({
    required this.name,
    required this.url,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
    };
  }

  factory Type.fromJson(Map<String, dynamic> json) => _$TypeFromJson(json);

  Map<String, dynamic> toJson() => _$TypeToJson(this);
}

@JsonSerializable()
class Moves {
  Move move;
  Moves({
    required this.move,
  });

  Map<String, dynamic> toMap() {
    return {
      'move': move.toMap(),
    };
  }

  factory Moves.fromJson(Map<String, dynamic> json) => _$MovesFromJson(json);

  Map<String, dynamic> toJson() => _$MovesToJson(this);
}

@JsonSerializable()
class Move {
  String name;
  String url;

  Move({
    required this.name,
    required this.url,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
    };
  }

  factory Move.fromJson(Map<String, dynamic> json) => _$MoveFromJson(json);

  Map<String, dynamic> toJson() => _$MoveToJson(this);
}

@JsonSerializable()
class Stats {
  @JsonKey(name: 'base_stat')
  int baseStat;
  int effort;
  Stat stat;

  Stats({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  Map<String, dynamic> toMap() {
    return {
      'baseStat': baseStat,
      'effort': effort,
      'stat': stat.toMap(),
    };
  }

  factory Stats.fromJson(Map<String, dynamic> json) => _$StatsFromJson(json);

  Map<String, dynamic> toJson() => _$StatsToJson(this);
}

@JsonSerializable()
class Stat {
  String name;
  String url;

  Stat({
    required this.name,
    required this.url,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
    };
  }

  factory Stat.fromJson(Map<String, dynamic> json) => _$StatFromJson(json);

  Map<String, dynamic> toJson() => _$StatToJson(this);
}
