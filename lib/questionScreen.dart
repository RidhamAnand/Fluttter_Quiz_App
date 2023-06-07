import 'package:flutter/material.dart';
import 'answer_button.dart';
import 'data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class questionScreen extends StatefulWidget {
  const questionScreen( {super.key, required this.onSelectAnswer});

  final Function(String answer) onSelectAnswer;

  @override
  State<questionScreen> createState() => _questionScreenState();
}

class _questionScreenState extends State<questionScreen> {
  var questionIndex = 0;

  void questionChange(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      questionIndex = questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[questionIndex];

    return Container(
      padding: const EdgeInsets.all(40),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30.0,
            ),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(answerText: answer, onTap: (){
                questionChange(answer);
                print(answer);
              });
            }),
          ],
        ),
      ),
    );
  }
}
