/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class Player extends _i1.SerializableEntity {
  Player._({
    required this.identifier,
    required this.name,
    required this.score,
  });

  factory Player({
    required String identifier,
    required String name,
    required int score,
  }) = _PlayerImpl;

  factory Player.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Player(
      identifier: serializationManager
          .deserialize<String>(jsonSerialization['identifier']),
      name: serializationManager.deserialize<String>(jsonSerialization['name']),
      score: serializationManager.deserialize<int>(jsonSerialization['score']),
    );
  }

  String identifier;

  String name;

  int score;

  Player copyWith({
    String? identifier,
    String? name,
    int? score,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'identifier': identifier,
      'name': name,
      'score': score,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'identifier': identifier,
      'name': name,
      'score': score,
    };
  }
}

class _PlayerImpl extends Player {
  _PlayerImpl({
    required String identifier,
    required String name,
    required int score,
  }) : super._(
          identifier: identifier,
          name: name,
          score: score,
        );

  @override
  Player copyWith({
    String? identifier,
    String? name,
    int? score,
  }) {
    return Player(
      identifier: identifier ?? this.identifier,
      name: name ?? this.name,
      score: score ?? this.score,
    );
  }
}
