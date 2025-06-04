import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/answer_buttons.dart';
import '../data/questions.dart';
import '../models/quiz_question.dart';

class QuestionsPage extends StatefulWidget {
  final void Function(String) onSelectAnswer;

  const QuestionsPage({super.key, required this.onSelectAnswer});

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  int currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() => currentQuestionIndex++);
  }

  @override
  Widget build(BuildContext context) {
    final QuizQuestion currentQuestion = questions[currentQuestionIndex];
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(currentQuestion.question, style: GoogleFonts.lato(color: const Color.fromARGB(255, 201, 153, 251), fontSize: 24, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
              const SizedBox(height: 30),
              ...currentQuestion.shuffledAnswers.map((String e) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: AnswerButtons(onPressed: () => answerQuestion(e), text: e),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
