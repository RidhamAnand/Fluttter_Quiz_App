import 'package:flutter/material.dart';
import 'answer_button.dart';
import 'data/questions.dart';
import 'quiz.dart';
import 'question_summary.dart';

final class ResultScreen extends StatelessWidget {
  ResultScreen(
      {super.key, required this.userAnswers, required this.restartFunc});
  void Function() restartFunc;
  List<String> userAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < userAnswers.length; i++) {
      summary.add({
        'questionIndex': i,
        'question': questions[i].text,
        'userAnswer': userAnswers[i],
        'correctAnswer': questions[i].answers[0],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length.toString();
    final numCorrectQuestions = summaryData
        .where((data) {
          return (data['userAnswer'] == data['correctAnswer']);
        })
        .length
        .toString();

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly',
              style: const TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(getSummaryData()),
            const SizedBox(height: 30,),
            OutlinedButton.icon(
              onPressed: restartFunc,
              icon: const Icon(
                Icons.restart_alt_sharp,
                color: Colors.white,
              ),
              label: const Text('Restart',style: TextStyle(
                color: Colors.white,
              ),),
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.blue,
            ),)
          ],
        ),
      ),
    );
  }
}
