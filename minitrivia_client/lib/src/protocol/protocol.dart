/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'example.dart' as _i2;
import 'game_state.dart' as _i3;
import 'player.dart' as _i4;
import 'question.dart' as _i5;
import 'reaction.dart' as _i6;
import 'protocol.dart' as _i7;
export 'example.dart';
export 'game_state.dart';
export 'player.dart';
export 'question.dart';
export 'reaction.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Map<Type, _i1.constructor> customConstructors = {};

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (customConstructors.containsKey(t)) {
      return customConstructors[t]!(data, this) as T;
    }
    if (t == _i2.Example) {
      return _i2.Example.fromJson(data, this) as T;
    }
    if (t == _i3.GameState) {
      return _i3.GameState.fromJson(data, this) as T;
    }
    if (t == _i4.Player) {
      return _i4.Player.fromJson(data, this) as T;
    }
    if (t == _i5.Question) {
      return _i5.Question.fromJson(data, this) as T;
    }
    if (t == _i6.Reaction) {
      return _i6.Reaction.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i2.Example?>()) {
      return (data != null ? _i2.Example.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i3.GameState?>()) {
      return (data != null ? _i3.GameState.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i4.Player?>()) {
      return (data != null ? _i4.Player.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i5.Question?>()) {
      return (data != null ? _i5.Question.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i6.Reaction?>()) {
      return (data != null ? _i6.Reaction.fromJson(data, this) : null) as T;
    }
    if (t == List<_i7.Player>) {
      return (data as List).map((e) => deserialize<_i7.Player>(e)).toList()
          as dynamic;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList()
          as dynamic;
    }
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    if (data is _i2.Example) {
      return 'Example';
    }
    if (data is _i3.GameState) {
      return 'GameState';
    }
    if (data is _i4.Player) {
      return 'Player';
    }
    if (data is _i5.Question) {
      return 'Question';
    }
    if (data is _i6.Reaction) {
      return 'Reaction';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'Example') {
      return deserialize<_i2.Example>(data['data']);
    }
    if (data['className'] == 'GameState') {
      return deserialize<_i3.GameState>(data['data']);
    }
    if (data['className'] == 'Player') {
      return deserialize<_i4.Player>(data['data']);
    }
    if (data['className'] == 'Question') {
      return deserialize<_i5.Question>(data['data']);
    }
    if (data['className'] == 'Reaction') {
      return deserialize<_i6.Reaction>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
