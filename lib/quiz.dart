import 'package:flutter/material.dart';
import 'package:my_app/questionScreen.dart';
import 'startScreen.dart';
import 'data/questions.dart';
import 'resultScreen.dart';

class quiz extends StatefulWidget {
  const quiz({super.key});

  @override
  State<quiz> createState() => _quizState();
}

class _quizState extends State<quiz> {
   List<String> selectedAnswer = [];
  var activeScreen = "start-screen";

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);
    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = "result-screen";
      });
    }
  }

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void restartScreen(){
    setState(() {
      selectedAnswer = [];
      activeScreen = 'restart-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = startScreen(switchScreen);
    if (activeScreen == 'question-screen')   {
      screenWidget = questionScreen(onSelectAnswer: chooseAnswer);
    }
    if(activeScreen=="result-screen"){
      screenWidget =  ResultScreen(userAnswers: selectedAnswer,restartFunc: restartScreen,);
    }

    if (activeScreen == "restart-screen"){
      screenWidget== startScreen(switchScreen);
      selectedAnswer = [];
      ResultScreen(userAnswers:selectedAnswer, restartFunc: restartScreen);
    }


    return MaterialApp(
      home: Scaffold(
        body: screenWidget,
      ),
    );
  }
}
