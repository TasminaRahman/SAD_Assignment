import 'dart:io';

class Question {
  String questionText;
  List<String> options;
  int correctAnswer; // index of correct option

  Question(this.questionText, this.options, this.correctAnswer);
}

class Quiz {
  List<Question> questions;
  int score = 0;

  Quiz(this.questions);

  void start() {
    print('--- Welcome to the Quiz ---\n');

    for (int i = 0; i < questions.length; i++) {
      var q = questions[i];
      print('Q${i + 1}: ${q.questionText}');
      for (int j = 0; j < q.options.length; j++) {
        print('${j + 1}. ${q.options[j]}');
      }

      stdout.write('Your answer (1-${q.options.length}): ');
      var input = stdin.readLineSync();
      int? ans = int.tryParse(input ?? '');

      if (ans != null && ans - 1 == q.correctAnswer) {
        print('✅ Correct!\n');
        score++;
      } else {
        print('❌ Wrong! Correct answer: ${q.options[q.correctAnswer]}\n');
      }
    }

    print('--- Quiz Finished ---');
    print('Your Score: $score / ${questions.length}');
  }
}

void main() {
  List<Question> quizQuestions = [
    Question('What is the capital of Bangladesh?', ['Dhaka', 'Chittagong', 'Sylhet'], 0),
    Question('Dart is developed by?', ['Google', 'Microsoft', 'Apple'], 0),
    Question('Which keyword is used to create a class?', ['object', 'class', 'define'], 1),
  ];

  Quiz quiz = Quiz(quizQuestions);
  quiz.start();
}
