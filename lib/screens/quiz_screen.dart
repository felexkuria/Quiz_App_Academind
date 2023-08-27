import 'package:flutter/material.dart';
import 'package:quiz_app/questions.dart';
import 'package:quiz_app/screens/result_screen.dart';
//import 'package:quiz_app/questtions_screen.dart';
import 'package:quiz_app/screens/start_screen.dart';

import 'questtions_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;
  @override
  void initState() {
    activeScreen = StartScreen(startQuiz: changeScreen);
    super.initState();
  }

  void changeScreen() {
    setState(() {
      activeScreen = QuestionScreen(
        onSelectAnswer: chooseAnswer,
      );
    });
  }

  List<String> selectedAnswers = [];

  void onRestart() {
    setState(() {
      selectedAnswers == [];
      activeScreen ==
          StartScreen(
            startQuiz: changeScreen,
          );
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        //   selectedAnswers = [];
        activeScreen = ResultScreen(
          choosenAnswers: selectedAnswers,
          onRestart: () {},
        );
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        //  colorScheme: lightColorScheme,
      ),
      home: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Color.fromARGB(252, 81, 0, 155),
                Color.fromARGB(252, 107, 15, 168),
              ])),
          child: activeScreen,
        ),
      ),
    );
  }
}
