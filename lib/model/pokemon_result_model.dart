// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

part 'pokemon_result_model.g.dart';

@JsonSerializable()
class ResultModel {
  @JsonKey(name: 'results')
  List<PokemonResultModel> pokemonResult;

  int count;
  String? previous;
  String? next;

  ResultModel({
    required this.pokemonResult,
    required this.count,
    required this.previous,
    required this.next,
  });

  factory ResultModel.fromJson(Map<String, dynamic> json) =>
      _$ResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResultModelToJson(this);

  @override
  String toString() {
    return 'Result(count: $count, previous: $previous, next: $next, pokemonResult: $pokemonResult)';
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
