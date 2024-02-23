/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:minitrivia_client/src/protocol/player.dart' as _i3;
import 'package:minitrivia_client/src/protocol/game_state.dart' as _i4;
import 'protocol.dart' as _i5;

/// {@category Endpoint}
class EndpointExample extends _i1.EndpointRef {
  EndpointExample(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'example';

  _i2.Future<String> hello(String name) => caller.callServerEndpoint<String>(
        'example',
        'hello',
        {'name': name},
      );
}

/// {@category Endpoint}
class EndpointTrivia extends _i1.EndpointRef {
  EndpointTrivia(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'trivia';

  _i2.Future<_i3.Player> join(String name) =>
      caller.callServerEndpoint<_i3.Player>(
        'trivia',
        'join',
        {'name': name},
      );

  _i2.Future<_i4.GameState> getGameState() =>
      caller.callServerEndpoint<_i4.GameState>(
        'trivia',
        'getGameState',
        {},
      );

  _i2.Future<bool> submitAnswer(
    String playerIdentifier,
    int questionId,
    int answer,
  ) =>
      caller.callServerEndpoint<bool>(
        'trivia',
        'submitAnswer',
        {
          'playerIdentifier': playerIdentifier,
          'questionId': questionId,
          'answer': answer,
        },
      );
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
  }) : super(
          host,
          _i5.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
        ) {
    example = EndpointExample(this);
    trivia = EndpointTrivia(this);
  }

  late final EndpointExample example;

  late final EndpointTrivia trivia;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'example': example,
        'trivia': trivia,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
