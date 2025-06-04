import 'package:flutter/material.dart';

import 'question_identifier.dart';

class SummaryItem extends StatelessWidget {
  final Map<String, Object> itemData;

  const SummaryItem(this.itemData, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          QuestionIdentifier(isCorrectAnswer: itemData['user_answer'] == itemData['correct_answer'], questionIndex: itemData['question_index'] as int),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  itemData['question'].toString(),
                  style: const TextStyle(fontFamily: 'Lato', fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
                ),
                const SizedBox(height: 5),
                Text('User: ${itemData['user_answer'].toString()}', style: const TextStyle(color: Color.fromARGB(255, 202, 171, 252))),
                Text('Correct: ${itemData['correct_answer'].toString()}', style: const TextStyle(color: Color.fromARGB(255, 181, 254, 246))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
