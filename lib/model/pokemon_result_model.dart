// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

part 'pokemon_result_model.g.dart';

@JsonSerializable()
class Result {
  List<PokemonResultModel> pokemonResult;
  int count;
  String previous;
  String next;

  Result({
    required this.pokemonResult,
    required this.count,
    required this.previous,
    required this.next,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);

  @override
  String toString() {
    return 'Result(pokemonResult: $pokemonResult, count: $count, previous: $previous, next: $next)';
  }
}

@JsonSerializable()
class PokemonResultModel {
  String name;
  String url;

  PokemonResultModel({
    required this.name,
    required this.url,
  });

  factory PokemonResultModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonResultModelToJson(this);
}
