
// -----------------------------
// Quiz Home & Play Pages
// -----------------------------
import 'package:flutter/material.dart';
import 'package:learn_flowers/data/sample_data.dart';
import 'package:learn_flowers/pages/quiz_play_page.dart';
import 'package:learn_flowers/providers/quiz_provider.dart';
import 'package:learn_flowers/providers/settings_provider.dart';
import 'package:provider/provider.dart';

class QuizHomePage extends StatelessWidget {
  const QuizHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<SettingsProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Quiz')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Choose a quiz', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                final questions = buildSimpleQuiz(context, 8);
                Provider.of<QuizProvider>(context, listen: false).startQuiz(questions);
                Navigator.push(context, MaterialPageRoute(builder: (_) => const QuizPlayPage()));
              },
              child: const Text('8-question: Name from description'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                final questions = buildColorQuiz(context, 8);
                Provider.of<QuizProvider>(context, listen: false).startQuiz(questions);
                Navigator.push(context, MaterialPageRoute(builder: (_) => const QuizPlayPage()));
              },
              child: const Text('8-question: Color quiz'),
            ),
            const SizedBox(height: 12),
            Text('Tip: quizzes are text-only. Increase font size in Settings if needed.',
                style: TextStyle(fontSize: settings.fontSize - 2)),
          ],
        ),
      ),
    );
  }
}
