import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quiz_provider.g.dart';

@riverpod
class Quiz extends _$Quiz {
  @override
  List<String> build() => <String>[];

  void add (String selectedAnswer) => state.add(selectedAnswer);
}