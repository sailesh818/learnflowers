
import 'package:flutter/material.dart';
import 'package:learn_flowers/data/sample_data.dart';
import 'package:learn_flowers/providers/quiz_provider.dart';
import 'package:provider/provider.dart';

class QuizPlayPage extends StatelessWidget {
  const QuizPlayPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<QuizProvider>(builder: (ctx, quiz, _) {
      if (!quiz.started && quiz.questions.isEmpty) {
        return Scaffold(appBar: AppBar(title: const Text('Quiz')), body: const Center(child: Text('No quiz loaded')));
      }

      if (!quiz.started && quiz.questions.isNotEmpty && quiz.currentIndex >= quiz.questions.length) {
        return Scaffold(
          appBar: AppBar(title: const Text('Quiz Result')),
          body: Center(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Text('You scored ${quiz.score} / ${quiz.questions.length}', style: const TextStyle(fontSize: 22)),
              const SizedBox(height: 12),
              ElevatedButton(onPressed: () => quiz.reset(), child: const Text('Done')),
              const SizedBox(height: 8),
              ElevatedButton(
                  onPressed: () {
                    final questions = buildSimpleQuiz(context, 8);
                    quiz.startQuiz(questions);
                  },
                  child: const Text('Play again'))
            ]),
          ),
        );
      }

      final q = quiz.questions[quiz.currentIndex];

      return Scaffold(
        appBar: AppBar(title: Text('Question ${quiz.currentIndex + 1} / ${quiz.questions.length}')),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(q.question, style: const TextStyle(fontSize: 20)),
              const SizedBox(height: 20),
              ...q.options.map((o) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: ElevatedButton(
                        onPressed: () => quiz.answer(o),
                        child: Text(o, style: const TextStyle(fontSize: 18))),
                  ))
            ],
          ),
        ),
      );
    });
  }
}
