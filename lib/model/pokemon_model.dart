// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'pokemon_model.g.dart';

@JsonSerializable()
class PokemonModel {
  String name;
  int id;
  int height;
  int weight;

  @JsonKey(name: 'sprites')
  Sprites sprites;

  List<Types> types;
  List<Moves> moves;

  PokemonModel({
    required this.id,
    required this.name,
    required this.height,
    required this.weight,
    required this.sprites,
    required this.types,
    required this.moves,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonModelFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonModelToJson(this);
}

@JsonSerializable()
class Sprites {
  @JsonKey(name: 'front_default')
  String frontDefault;
  Other other;

  Sprites({
    required this.frontDefault,
    required this.other,
  });

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

  factory Other.fromJson(Map<String, dynamic> json) => _$OtherFromJson(json);

  Map<String, dynamic> toJson() => _$OtherToJson(this);
}

@JsonSerializable()
class OfficialArtWork {
  @JsonKey(name: 'front_default')
  String frontDefault;

  OfficialArtWork({
    required this.frontDefault,
  });

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

  factory Type.fromJson(Map<String, dynamic> json) => _$TypeFromJson(json);

  Map<String, dynamic> toJson() => _$TypeToJson(this);
}

@JsonSerializable()
class Moves {
  Move move;
  Moves({
    required this.move,
  });

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

  factory Move.fromJson(Map<String, dynamic> json) => _$MoveFromJson(json);

  Map<String, dynamic> toJson() => _$MoveToJson(this);
}
