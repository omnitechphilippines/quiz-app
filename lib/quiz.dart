import 'package:flutter/material.dart';

import 'data/questions.dart';
import 'pages/questions_page.dart';
import 'pages/results_page.dart';
import 'pages/start_quiz_page.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  String _activePage = 'start-page';
  final List<String> _chosenAnswers = <String>[];

  void _switchPage() => setState(() => _activePage = 'questions-page');

  void onRestart() {
    setState(() {
      _chosenAnswers.clear();
      _activePage = 'questions-page';
    });
  }

  void onSelectAnswer(String answer) {
    _chosenAnswers.add(answer);
    if (_chosenAnswers.length == questions.length) {
      setState(() => _activePage = 'results-page');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: LinearGradient(colors: <Color>[Color.fromARGB(255, 78, 13, 151), Color.fromARGB(255, 107, 15, 168)], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: _activePage == 'start-page'
            ? StartQuizPage(_switchPage)
            : _activePage == 'questions-page'
                ? QuestionsPage(onSelectAnswer: onSelectAnswer)
                : ResultsPage(chosenAnswers: _chosenAnswers, onRestartQuiz: onRestart),
      ),
    );
  }
}
