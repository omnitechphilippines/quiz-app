class QuizQuestion {
  final String question;
  final List<String> answers;

  const QuizQuestion(this.question, this.answers);

  List<String> get shuffledAnswers {
    final List<String> shuffledList = answers.toList();
    shuffledList.shuffle();
    return shuffledList;
  }
}
