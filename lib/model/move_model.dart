// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:pokedex_getx/model/pokemon_model.dart';

part 'move_model.g.dart';

@JsonSerializable()
class MoveModel {
  String? name;
  Type? type;
  int? accuracy;
  int? power;
  int? pp;
  int? priority;

  MoveModel({
    required this.name,
    required this.type,
    required this.accuracy,
    required this.power,
    required this.pp,
    required this.priority,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'type': type!.toMap(),
      'accuracy': accuracy,
      'power': power,
      'pp': pp,
      'priority': priority,
    };
  }

  MoveModel.fromDocument(DocumentSnapshot? document) {
    name = document?['name'];
    type = Type.fromDocument(document?['type']);
    accuracy = document?['accuracy'];
    power = document?['power'];
    pp = document?['pp'];
    priority = document?['priority'];
  }

  factory MoveModel.fromJson(Map<String, dynamic> json) =>
      _$MoveModelFromJson(json);

  Map<String, dynamic> toJson() => _$MoveModelToJson(this);
}

@JsonSerializable()
class ResultMoveModel {
  String? name;
  String? url;

  ResultMoveModel({
    required this.name,
    required this.url,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'url': url,
    };
  }

  ResultMoveModel.fromDocument(DocumentSnapshot? document) {
    name = document?['name'];
    url = document?['url'];
  }

  factory ResultMoveModel.fromJson(Map<String, dynamic> json) =>
      _$ResultMoveModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResultMoveModelToJson(this);

  @override
  String toString() => 'ResultMoveModel(name: $name, url: $url)';
}
