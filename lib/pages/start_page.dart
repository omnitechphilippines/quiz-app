import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: <Color>[Color.fromARGB(255, 78, 13, 151), Color.fromARGB(255, 107, 15, 168)], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/quiz-logo.png', width: 300, color: const Color.fromARGB(175, 255, 255, 255)),
              const SizedBox(height: 80),
              const Text('Learn Flutter the fun way!', style: TextStyle(color: Color.fromARGB(255, 237, 223, 252), fontSize: 24)),
              const SizedBox(height: 30),
              OutlinedButton.icon(
                onPressed: () => context.go('/questions'),
                style: ButtonStyle(foregroundColor: WidgetStateProperty.all(Colors.white)),
                icon: const Icon(Icons.arrow_right_alt),
                label: const Text('Start Quiz'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
