/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod_serialization/serverpod_serialization.dart';

abstract class Question extends _i1.SerializableEntity {
  Question._({
    required this.id,
    required this.question,
    required this.answers,
    required this.correctAnswer,
  });

  factory Question({
    required int id,
    required String question,
    required List<String> answers,
    required int correctAnswer,
  }) = _QuestionImpl;

  factory Question.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Question(
      id: serializationManager.deserialize<int>(jsonSerialization['id']),
      question: serializationManager
          .deserialize<String>(jsonSerialization['question']),
      answers: serializationManager
          .deserialize<List<String>>(jsonSerialization['answers']),
      correctAnswer: serializationManager
          .deserialize<int>(jsonSerialization['correctAnswer']),
    );
  }

  int id;

  String question;

  List<String> answers;

  int correctAnswer;

  Question copyWith({
    int? id,
    String? question,
    List<String>? answers,
    int? correctAnswer,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'question': question,
      'answers': answers.toJson(),
      'correctAnswer': correctAnswer,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'question': question,
      'answers': answers.toJson(),
      'correctAnswer': correctAnswer,
    };
  }
}

class _QuestionImpl extends Question {
  _QuestionImpl({
    required int id,
    required String question,
    required List<String> answers,
    required int correctAnswer,
  }) : super._(
          id: id,
          question: question,
          answers: answers,
          correctAnswer: correctAnswer,
        );

  @override
  Question copyWith({
    int? id,
    String? question,
    List<String>? answers,
    int? correctAnswer,
  }) {
    return Question(
      id: id ?? this.id,
      question: question ?? this.question,
      answers: answers ?? this.answers.clone(),
      correctAnswer: correctAnswer ?? this.correctAnswer,
    );
  }
}
