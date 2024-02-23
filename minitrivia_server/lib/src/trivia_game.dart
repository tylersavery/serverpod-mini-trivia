// ignore_for_file: constant_identifier_names

import 'dart:async';
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:minitrivia_server/src/endpoints/trivia_endpoint.dart';
import 'package:minitrivia_server/src/generated/protocol.dart';
import 'package:http/http.dart' as http;
import 'package:serverpod/serverpod.dart';

const SECONDS_PER_ROUND = 10;

class TriviaGame {
  late final Session session;

  TriviaGame() {
    Serverpod.instance.createSession(enableLogging: true).then((value) {
      session = value;
    });
  }

  List<Question> questions = [];
  int questionIndex = 0;

  Timer? timer;
  int roundEnds = 0;

  List<Player> players = [];

  Future<void> start() async {
    await _loadQuestions();
    roundEnds = (DateTime.now().add(Duration(seconds: SECONDS_PER_ROUND)).millisecondsSinceEpoch / 1000).round();

    timer = Timer.periodic(Duration(seconds: SECONDS_PER_ROUND), (timer) {
      _nextQuestion();
    });
  }

  Future<void> _loadQuestions() async {
    const url = "https://opentdb.com/api.php?amount=10&category=9&type=multiple";
    final response = await http.get(Uri.parse(url));

    final data = jsonDecode(response.body);

    int id = 0;
    for (final result in data['results']) {
      final List<String> answers = [...result['incorrect_answers'], result['correct_answer']]..shuffle();
      final correctAnswer = answers.indexWhere((a) => a == result['correct_answer']);

      questions.add(Question(
        id: id,
        question: result['question'],
        answers: answers,
        correctAnswer: correctAnswer,
      ));
      id++;
    }
  }

  void _nextQuestion() {
    questionIndex++;
    if (questionIndex >= questions.length) {
      questionIndex = 0;
    }

    roundEnds = (DateTime.now().add(Duration(seconds: SECONDS_PER_ROUND)).millisecondsSinceEpoch / 1000).round();

    session.messages.postMessage(CHANNEL_NAME, currentGameState);
  }

  Question get currentQuestion {
    return questions[questionIndex];
  }

  GameState get currentGameState {
    return GameState(
      players: players,
      question: currentQuestion,
      roundEnds: roundEnds,
    );
  }

  void addPlayer(Player player) {
    players = [...players, player];
  }

  bool checkAnswer(int questionId, int answer) {
    final question = questions.firstWhereOrNull((q) => q.id == questionId);
    if (question == null) {
      print("Question not found with identifier $questionId");
      return false;
    }

    return question.correctAnswer == answer;
  }

  void updateScore(String playerIdentifier, int amount) {
    final playerIndex = players.indexWhere((p) => p.identifier == playerIdentifier);

    if (playerIndex < 0) {
      print("player not found with identifier $playerIdentifier");
      return;
    }

    Player player = players[playerIndex];
    player = player.copyWith(score: player.score + amount);

    players[playerIndex] = player;
  }
}
