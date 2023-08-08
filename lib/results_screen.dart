import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/Data/questions.dart';
import 'package:quiz_app/questions_summary.dart';


// ignore: must_be_immutable
class ResultsScreen extends StatelessWidget {
  ResultsScreen({
    super.key,
    required this.choosenAnswer,
    required this.restartQuiz,
  });
  List<String> choosenAnswer;
  void Function() restartQuiz;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < choosenAnswer.length; i++) {
      summary.add(
        {
          'question index': i,
          'question': questions[i].questions,
          'user answer': choosenAnswer[i],
          'correct answer': questions[i].answers[0],
          'correct' : questions[i].answers[0] == choosenAnswer[i],
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numTotalCorrectAnswer = summaryData.where((data) {
      return data['user answer'] == data['correct answer'];
    }).length;
   

    

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "you answered $numTotalCorrectAnswer out of $numTotalQuestions questions correctly!",
              style: GoogleFonts.akshar(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            // question summary which we build in questions_summary class...
            QuestionsSummary(
              summaryData,
              
            ),

            const SizedBox(
              height: 20,
            ),
            TextButton.icon(
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              icon: const Icon(Icons.refresh_outlined),
              onPressed: restartQuiz,
              label: const Text("restart quiz"),
            ),
          ],
        ),
      ),
    );
  }
}
