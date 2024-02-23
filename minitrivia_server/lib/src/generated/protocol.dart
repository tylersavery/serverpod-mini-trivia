/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod/protocol.dart' as _i2;
import 'example.dart' as _i3;
import 'game_state.dart' as _i4;
import 'player.dart' as _i5;
import 'question.dart' as _i6;
import 'reaction.dart' as _i7;
import 'protocol.dart' as _i8;
export 'example.dart';
export 'game_state.dart';
export 'player.dart';
export 'question.dart';
export 'reaction.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Map<Type, _i1.constructor> customConstructors = {};

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    ..._i2.Protocol.targetTableDefinitions
  ];

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (customConstructors.containsKey(t)) {
      return customConstructors[t]!(data, this) as T;
    }
    if (t == _i3.Example) {
      return _i3.Example.fromJson(data, this) as T;
    }
    if (t == _i4.GameState) {
      return _i4.GameState.fromJson(data, this) as T;
    }
    if (t == _i5.Player) {
      return _i5.Player.fromJson(data, this) as T;
    }
    if (t == _i6.Question) {
      return _i6.Question.fromJson(data, this) as T;
    }
    if (t == _i7.Reaction) {
      return _i7.Reaction.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i3.Example?>()) {
      return (data != null ? _i3.Example.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i4.GameState?>()) {
      return (data != null ? _i4.GameState.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i5.Player?>()) {
      return (data != null ? _i5.Player.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i6.Question?>()) {
      return (data != null ? _i6.Question.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i7.Reaction?>()) {
      return (data != null ? _i7.Reaction.fromJson(data, this) : null) as T;
    }
    if (t == List<_i8.Player>) {
      return (data as List).map((e) => deserialize<_i8.Player>(e)).toList()
          as dynamic;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList()
          as dynamic;
    }
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    if (data is _i3.Example) {
      return 'Example';
    }
    if (data is _i4.GameState) {
      return 'GameState';
    }
    if (data is _i5.Player) {
      return 'Player';
    }
    if (data is _i6.Question) {
      return 'Question';
    }
    if (data is _i7.Reaction) {
      return 'Reaction';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'Example') {
      return deserialize<_i3.Example>(data['data']);
    }
    if (data['className'] == 'GameState') {
      return deserialize<_i4.GameState>(data['data']);
    }
    if (data['className'] == 'Player') {
      return deserialize<_i5.Player>(data['data']);
    }
    if (data['className'] == 'Question') {
      return deserialize<_i6.Question>(data['data']);
    }
    if (data['className'] == 'Reaction') {
      return deserialize<_i7.Reaction>(data['data']);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'minitrivia';
}
