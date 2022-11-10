// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:pokedex_getx/model/pokemon_model.dart';

part 'move_model.g.dart';

@JsonSerializable()
class MoveModel {
  final String name;
  final Type type;
  MoveModel({
    required this.name,
    required this.type,
  });

  factory MoveModel.fromJson(Map<String, dynamic> json) =>
      _$MoveModelFromJson(json);

  Map<String, dynamic> toJson() => _$MoveModelToJson(this);
}

@JsonSerializable()
class ResultMoveModel {
  final String name;
  final String url;

  ResultMoveModel({
    required this.name,
    required this.url,
  });

  factory ResultMoveModel.fromJson(Map<String, dynamic> json) =>
      _$ResultMoveModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResultMoveModelToJson(this);

  @override
  String toString() => 'ResultMoveModel(name: $name, url: $url)';
}
