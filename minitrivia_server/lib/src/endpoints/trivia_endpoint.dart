// ignore_for_file: constant_identifier_names

import 'package:minitrivia_server/server.dart';
import 'package:minitrivia_server/src/generated/protocol.dart';
import 'package:minitrivia_server/src/utils.dart';
import 'package:serverpod/serverpod.dart';

const CHANNEL_NAME = 'trivia_channel';

class TriviaEndpoint extends Endpoint {
  @override
  Future<void> streamOpened(StreamingSession session) async {
    sendStreamMessage(session, game.currentQuestion);
    session.messages.addListener(CHANNEL_NAME, (update) {
      sendStreamMessage(session, update);
    });
  }

  @override
  Future<void> handleStreamMessage(StreamingSession session, SerializableEntity message) async {
    if (message is Reaction) {
      session.messages.postMessage(CHANNEL_NAME, message);
    }
  }

  Future<Player> join(Session session, String name) async {
    final identifier = generateRandomString(16);

    final player = Player(identifier: identifier, name: name, score: 0);
    game.addPlayer(player);

    session.messages.postMessage(CHANNEL_NAME, game.currentGameState);

    return player;
  }

  Future<GameState> getGameState(Session session) async {
    return game.currentGameState;
  }

  Future<bool> submitAnswer(Session session, String playerIdentifier, int questionId, int answer) async {
    final correct = game.checkAnswer(questionId, answer);
    if (correct) {
      game.updateScore(playerIdentifier, 1);
      return true;
    }

    return false;
  }
}
