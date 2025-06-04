import '../models/quiz_question.dart';

const List<QuizQuestion> questions = <QuizQuestion>[
  QuizQuestion('What are the main building blocks of Flutter UIs?', <String>['Widgets', 'Components', 'Blocks', 'Functions']),
  QuizQuestion('How are Flutter UIs built?', <String>['By combining widgets in code', 'By combining widgets in a visual editor', 'By defining widgets in config files', 'By using XCode for iOS and Android Studio for Android']),
  QuizQuestion("What's the purpose of a StatefulWidget?", <String>['Update UI as data changes', 'Update data as UI changes', 'Ignore data changes', 'Render UI that does not depend on data']),
  QuizQuestion('Which widget should you try to use more often: StatelessWidget or StatefulWidget??', <String>['StatelessWidget', 'StatefulWidget', 'Both are equally good', 'None of the above']),
  QuizQuestion('What happens if you change data in a StatelessWidget?', <String>['The UI is not updated', 'The UI is updated', 'The closest StatefulWidget is updated', 'Any nested StatefulWidgets are updated']),
  QuizQuestion('How should you update data inside of StatefulWidgets??', <String>['By calling setState()', 'By calling updateData()', 'By calling updateUI()', 'By calling updateState()']),
];
