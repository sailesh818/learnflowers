
import 'package:flutter/material.dart';
import 'package:learn_flowers/model/flower_model.dart';

class QuizProvider extends ChangeNotifier {
  List<QuizQuestion> _questions = [];
  int _current = 0;
  int _score = 0;
  bool _started = false;

  List<QuizQuestion> get questions => _questions;
  int get currentIndex => _current;
  int get score => _score;
  bool get started => _started;

  void startQuiz(List<QuizQuestion> questions) {
    _questions = List.from(questions);
    _current = 0;
    _score = 0;
    _started = true;
    notifyListeners();
  }

  void answer(String answer) {
    if (!_started) return;
    final q = _questions[_current];
    if (q.correctAnswer == answer) _score += 1;
    _current += 1;
    if (_current >= _questions.length) _started = false;
    notifyListeners();
  }

  void reset() {
    _questions = [];
    _current = 0;
    _score = 0;
    _started = false;
    notifyListeners();
  }
}