import 'package:flutter/material.dart';

import 'summary_item.dart';

class QuestionsSummary extends StatelessWidget {
  final List<Map<String, Object>> summaryData;

  const QuestionsSummary({super.key, required this.summaryData});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 400, child: SingleChildScrollView(child: Column(children: <Widget>[...summaryData.map((Map<String, Object> data) => SummaryItem(data))])));
  }
}
