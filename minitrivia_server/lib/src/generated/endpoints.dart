/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/example_endpoint.dart' as _i2;
import '../endpoints/trivia_endpoint.dart' as _i3;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'example': _i2.ExampleEndpoint()
        ..initialize(
          server,
          'example',
          null,
        ),
      'trivia': _i3.TriviaEndpoint()
        ..initialize(
          server,
          'trivia',
          null,
        ),
    };
    connectors['example'] = _i1.EndpointConnector(
      name: 'example',
      endpoint: endpoints['example']!,
      methodConnectors: {
        'hello': _i1.MethodConnector(
          name: 'hello',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['example'] as _i2.ExampleEndpoint).hello(
            session,
            params['name'],
          ),
        )
      },
    );
    connectors['trivia'] = _i1.EndpointConnector(
      name: 'trivia',
      endpoint: endpoints['trivia']!,
      methodConnectors: {
        'join': _i1.MethodConnector(
          name: 'join',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['trivia'] as _i3.TriviaEndpoint).join(
            session,
            params['name'],
          ),
        ),
        'getGameState': _i1.MethodConnector(
          name: 'getGameState',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['trivia'] as _i3.TriviaEndpoint).getGameState(session),
        ),
        'submitAnswer': _i1.MethodConnector(
          name: 'submitAnswer',
          params: {
            'playerIdentifier': _i1.ParameterDescription(
              name: 'playerIdentifier',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'questionId': _i1.ParameterDescription(
              name: 'questionId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'answer': _i1.ParameterDescription(
              name: 'answer',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['trivia'] as _i3.TriviaEndpoint).submitAnswer(
            session,
            params['playerIdentifier'],
            params['questionId'],
            params['answer'],
          ),
        ),
      },
    );
  }
}
