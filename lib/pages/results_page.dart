import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../data/questions.dart';
import '../providers/quiz_provider.dart';
import '../questions_summary/summary_item.dart';

class ResultsPage extends ConsumerWidget {
  const ResultsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> chosenAnswers = ref.read(quizProvider);
    final List<Map<String, Object>> summary = chosenAnswers.asMap().entries.map((MapEntry<int, String> entry) {
      final int i = entry.key;
      final String answer = entry.value;
      return <String, Object>{
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'user_answer': answer,
      };
    }).toList();
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30),
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: <Color>[Color.fromARGB(255, 78, 13, 151), Color.fromARGB(255, 107, 15, 168)], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You answered ${summary.where((Map<String, Object> data) => data['user_answer'] == data['correct_answer']).length} out of ${questions.length} questions correctly!',
                style: const TextStyle(fontFamily: 'Lato', fontWeight: FontWeight.bold, fontSize: 20, color: Color.fromARGB(255, 230, 200, 253)),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              SizedBox(height: 400, child: SingleChildScrollView(child: Column(children: <Widget>[...summary.map((Map<String, Object> data) => SummaryItem(data))]))),
              const SizedBox(height: 30),
              TextButton.icon(
                onPressed: () {
                  chosenAnswers.clear();
                  context.go('/questions');
                },
                icon: const Icon(Icons.refresh, color: Colors.white),
                label: const Text('Restart Quiz!', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
