import 'dart:async';

import 'package:flutter/material.dart';
import 'package:minitrivia_client/minitrivia_client.dart';
import 'package:minitrivia_flutter/main.dart';
import 'package:html_unescape/html_unescape.dart';

const reactionOptions = ["🤣", "🙃", "🙏", "😡", "😀"];

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  TextEditingController nameController = TextEditingController();
  late final StreamingConnectionHandler connectionHandler;

  Player? player;
  GameState? gameState;
  List<int> questionsAnswered = [];
  List<Reaction> reactions = [];

  @override
  void initState() {
    super.initState();

    _listenToUpdates();

    connectionHandler = StreamingConnectionHandler(
        client: client,
        listener: (connectionState) {
          setState(() {});
        });

    connectionHandler.connect();
  }

  void _listenToUpdates() async {
    await for (var update in client.trivia.stream) {
      if (update is GameState) {
        setState(() {
          gameState = update;
          if (player != null) {
            player = update.players.firstWhere((p) => p.identifier == player!.identifier);
          }
        });
      } else if (update is Reaction) {
        setState(() {
          reactions = [...reactions, update];
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (player == null) {
      return Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 400),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(label: Text("Your Name")),
              ),
              SizedBox(
                height: 8,
              ),
              ElevatedButton(
                onPressed: () async {
                  final p = await client.trivia.join(nameController.text);
                  final gs = await client.trivia.getGameState();

                  setState(() {
                    player = p;
                    gameState = gs;
                  });
                },
                child: Text("Join Game"),
              )
            ],
          ),
        ),
      );
    }

    if (gameState == null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(),
            SizedBox(
              height: 8,
            ),
            Text("Waiting for next question"),
          ],
        ),
      );
    }

    final q = gameState!.question;
    final players = gameState!.players;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return SafeArea(
                        child: ListView.builder(
                          itemCount: players.length,
                          itemBuilder: (context, index) {
                            final p = players[index];
                            return Card(
                              child: ListTile(
                                title: Text(p.name),
                                subtitle: Text("Score: ${p.score}"),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                },
                child: Text(
                  "Total Players: ${players.length}",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              Text(
                "Score: ${player!.score}",
              ),
            ],
          ),
          Text(
            HtmlUnescape().convert(q.question),
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 32,
          ),
          ...q.answers.asMap().entries.map(
            (entry) {
              final index = entry.key;
              final answer = entry.value;
              return Opacity(
                opacity: questionsAnswered.contains(q.id) ? 0.4 : 1,
                child: InkWell(
                  onTap: questionsAnswered.contains(q.id)
                      ? null
                      : () async {
                          setState(() {
                            questionsAnswered = [...questionsAnswered, q.id];
                          });

                          final correct = await client.trivia.submitAnswer(player!.identifier, q.id, index);

                          if (context.mounted) {
                            if (correct) {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Correct!")));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Incorrect!")));
                            }
                          }
                        },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        HtmlUnescape().convert(answer),
                        style: Theme.of(context).textTheme.headlineSmall,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          SizedBox(
            height: 8,
          ),
          Center(
            child: Counter(
              roundEnds: gameState!.roundEnds,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Wrap(
            alignment: WrapAlignment.center,
            children: reactionOptions
                .map(
                  (r) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                        onTap: () {
                          client.trivia.sendStreamMessage(
                            Reaction(message: r, playerName: player!.name),
                          );
                        },
                        child: Text(r)),
                  ),
                )
                .toList(),
          ),
          SizedBox(
            height: 8,
          ),
          SizedBox(
            height: 44,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: reactions.length,
              itemBuilder: (context, index) {
                final reaction = reactions[index];
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("${reaction.message} ${reaction.playerName}"),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class Counter extends StatefulWidget {
  final int roundEnds;
  const Counter({super.key, required this.roundEnds});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  late int secondsRemaining;
  late Timer timer;

  @override
  void initState() {
    _updateValue();

    timer = Timer.periodic(Duration(milliseconds: 300), (timer) {
      _updateValue();
    });

    super.initState();
  }

  void _updateValue() {
    final roundEndsDateTime = DateTime.fromMillisecondsSinceEpoch(widget.roundEnds * 1000);

    setState(() {
      secondsRemaining = roundEndsDateTime.difference(DateTime.now()).inSeconds;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      "$secondsRemaining",
      style: Theme.of(context).textTheme.headlineLarge,
    );
  }
}
