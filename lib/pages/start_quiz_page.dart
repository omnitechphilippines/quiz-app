import 'package:flutter/material.dart';

class StartQuizPage extends StatelessWidget {
  final void Function() startQuiz;

  const StartQuizPage(this.startQuiz, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/images/quiz-logo.png', width: 300, color: const Color.fromARGB(175, 255, 255, 255)),
          const SizedBox(height: 80),
          const Text('Learn Flutter the fun way!', style: TextStyle(color: Color.fromARGB(255, 237, 223, 252), fontSize: 24)),
          const SizedBox(height: 30),
          OutlinedButton.icon(onPressed: startQuiz, style: ButtonStyle(foregroundColor: WidgetStateProperty.all(Colors.white)), icon: const Icon(Icons.arrow_right_alt), label: const Text('Start Quiz'))
        ],
      ),
    );
  }
}
