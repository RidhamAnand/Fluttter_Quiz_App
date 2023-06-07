import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummary extends StatelessWidget {
  QuestionSummary(this.summaryData, {super.key});
  List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Row(children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    ((data['questionIndex'] as int) + 1).toString(),
                    style:  GoogleFonts.poppins(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        (data['question']) as String,
                        textAlign: TextAlign.left,
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        (data['userAnswer']) as String,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.red[400],
                        ),
                      ),
                      Text(
                        (data['correctAnswer']) as String,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.green[800],
                          fontSize: 15.0,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )
              ]);
            },
          ).toList(),
        ),
      ),
    );
  }
}
