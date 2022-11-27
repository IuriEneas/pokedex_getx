// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'move_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoveModel _$MoveModelFromJson(Map<String, dynamic> json) => MoveModel(
      name: json['name'] as String?,
      type: json['type'] == null
          ? null
          : Type.fromJson(json['type'] as Map<String, dynamic>),
      accuracy: json['accuracy'] as int?,
      power: json['power'] as int?,
      pp: json['pp'] as int?,
      priority: json['priority'] as int?,
    );

Map<String, dynamic> _$MoveModelToJson(MoveModel instance) => <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'accuracy': instance.accuracy,
      'power': instance.power,
      'pp': instance.pp,
      'priority': instance.priority,
    };

ResultMoveModel _$ResultMoveModelFromJson(Map<String, dynamic> json) =>
    ResultMoveModel(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$ResultMoveModelToJson(ResultMoveModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
