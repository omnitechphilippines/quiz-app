import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/questions.dart';
import '../questions_summary/questions_summary.dart';

class ResultsPage extends StatelessWidget {
  final List<String> chosenAnswers;
  final void Function() onRestartQuiz;

  const ResultsPage({super.key, required this.chosenAnswers, required this.onRestartQuiz});

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = <Map<String, Object>>[];
    for (int i = 0; i < chosenAnswers.length; i++) {
      summary.add(<String, Object>{'question_index': i, 'question': questions[i].question, 'correct_answer': questions[i].answers[0], 'user_answer': chosenAnswers[i]});
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(40),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You answered ${summaryData.where((Map<String, Object> data) => data['user_answer'] == data['correct_answer']).length} out of ${questions.length} questions correctly!',
              style: GoogleFonts.lato(color: const Color.fromARGB(255, 230, 200, 253), fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            QuestionsSummary(summaryData: summaryData),
            const SizedBox(height: 30),
            TextButton.icon(onPressed: onRestartQuiz, icon: const Icon(Icons.refresh, color: Colors.white), label: const Text('Restart Quiz!', style: TextStyle(color: Colors.white))),
          ],
        ),
      ),
    );
  }
}
