import 'package:flutter/material.dart';

import 'package:quiz_app/question_button.dart';
import 'package:quiz_app/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion() {
    if (currentQuestionIndex <= questions.length) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      setState(() {
        currentQuestionIndex == 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.symmetric(
            vertical: 10, horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.questionText,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion.getShuffled().map((answer) {
              return AnswerButton(
                answerText: answer,
                onPressed: answerQuestion,
              );
            }),
          ],
        ),
      ),
    );
  }
}
