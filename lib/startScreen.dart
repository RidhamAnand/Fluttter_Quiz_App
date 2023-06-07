import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class startScreen extends StatelessWidget {
   const startScreen( this.startQuiz ,{ super.key});
  final void Function() startQuiz;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage('assets/duckimg.png'),
            width: 300.0,
          ),
          const SizedBox(
            height: 30,
          ),
           Text(
            "Learning Flutter",
            style: GoogleFonts.roboto(
              textStyle: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,

              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.purple[800],
              padding: EdgeInsets.all(20.0),
              shadowColor: Colors.black,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0),),
            ),
            icon: const Icon(Icons.not_started_rounded, color: Colors.white),
            label: const Text(
              "Start Quiz",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
