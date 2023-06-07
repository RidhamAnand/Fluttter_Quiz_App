import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  AnswerButton({required this.answerText, required this.onTap, super.key});

  final String answerText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.purple[800],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
      ),
      child: Text(answerText),
    );
  }
}
