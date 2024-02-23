/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class Reaction extends _i1.SerializableEntity {
  Reaction._({
    required this.message,
    required this.playerName,
  });

  factory Reaction({
    required String message,
    required String playerName,
  }) = _ReactionImpl;

  factory Reaction.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Reaction(
      message: serializationManager
          .deserialize<String>(jsonSerialization['message']),
      playerName: serializationManager
          .deserialize<String>(jsonSerialization['playerName']),
    );
  }

  String message;

  String playerName;

  Reaction copyWith({
    String? message,
    String? playerName,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'playerName': playerName,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'message': message,
      'playerName': playerName,
    };
  }
}

class _ReactionImpl extends Reaction {
  _ReactionImpl({
    required String message,
    required String playerName,
  }) : super._(
          message: message,
          playerName: playerName,
        );

  @override
  Reaction copyWith({
    String? message,
    String? playerName,
  }) {
    return Reaction(
      message: message ?? this.message,
      playerName: playerName ?? this.playerName,
    );
  }
}
