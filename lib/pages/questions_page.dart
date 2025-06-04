import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../providers/quiz_provider.dart';
import '../widgets/answer_buttons.dart';
import '../data/questions.dart';
import '../models/quiz_question.dart';

class QuestionsPage extends ConsumerStatefulWidget {
  const QuestionsPage({super.key});

  @override
  ConsumerState<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends ConsumerState<QuestionsPage> {
  int currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    setState(() => currentQuestionIndex++);
  }

  @override
  Widget build(BuildContext context) {
    final QuizQuestion currentQuestion = questions[currentQuestionIndex];
    final List<String> chosenAnswers = ref.watch(quizProvider);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: <Color>[Color.fromARGB(255, 78, 13, 151), Color.fromARGB(255, 107, 15, 168)], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    currentQuestion.question,
                    style: const TextStyle(fontFamily: 'Lato', fontWeight: FontWeight.bold, fontSize: 24, color: Color.fromARGB(255, 201, 153, 251)),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  ...currentQuestion.shuffledAnswers.map(
                    (String e) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: AnswerButtons(
                        onPressed: () {
                          chosenAnswers.add(e);
                          if (chosenAnswers.length == questions.length) {
                            context.go('/results');
                          }
                          else{
                            setState(() => currentQuestionIndex++);
                          }
                          // print(chosenAnswers);
                        },
                        text: e,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
