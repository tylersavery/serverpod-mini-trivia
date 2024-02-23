/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'protocol.dart' as _i2;

abstract class GameState extends _i1.SerializableEntity {
  GameState._({
    required this.players,
    required this.question,
    required this.roundEnds,
  });

  factory GameState({
    required List<_i2.Player> players,
    required _i2.Question question,
    required int roundEnds,
  }) = _GameStateImpl;

  factory GameState.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return GameState(
      players: serializationManager
          .deserialize<List<_i2.Player>>(jsonSerialization['players']),
      question: serializationManager
          .deserialize<_i2.Question>(jsonSerialization['question']),
      roundEnds:
          serializationManager.deserialize<int>(jsonSerialization['roundEnds']),
    );
  }

  List<_i2.Player> players;

  _i2.Question question;

  int roundEnds;

  GameState copyWith({
    List<_i2.Player>? players,
    _i2.Question? question,
    int? roundEnds,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'players': players.toJson(valueToJson: (v) => v.toJson()),
      'question': question.toJson(),
      'roundEnds': roundEnds,
    };
  }
}

class _GameStateImpl extends GameState {
  _GameStateImpl({
    required List<_i2.Player> players,
    required _i2.Question question,
    required int roundEnds,
  }) : super._(
          players: players,
          question: question,
          roundEnds: roundEnds,
        );

  @override
  GameState copyWith({
    List<_i2.Player>? players,
    _i2.Question? question,
    int? roundEnds,
  }) {
    return GameState(
      players: players ?? this.players.clone(),
      question: question ?? this.question.copyWith(),
      roundEnds: roundEnds ?? this.roundEnds,
    );
  }
}
