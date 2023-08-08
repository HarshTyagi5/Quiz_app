import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class StartScreen extends StatelessWidget {
  StartScreen(this.startScreen, {super.key});
  void Function() startScreen;
  @override
  Widget build(context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      //  children: [
      // Method to perform transparency on image but not the recommended method...
      // Opacity(
      //   opacity: 0.5,
      //   child: Image.asset(
      //     'lib/assests/quizlogo.png',
      //     width: 300,
      //   ),
      // ),
      children: [
        Image.asset(
          'lib/assests/quizlogo.png',
          width: 300,
          // for making the image transparent...
          color: const Color.fromARGB(149, 229, 228, 233),
        ),
// Sized box for spacing......
        const SizedBox(
          height: 20,
        ),

         Text(
          'Learn flutter in a fun way!',
          style: GoogleFonts.notoSansOldItalic(
            fontSize: 20,
            color: const Color.fromARGB(255, 202, 194, 242),
            fontWeight: FontWeight.bold
          ),
        ),
        // sized box.....
        const SizedBox(
          height: 20,
        ),
        // Button with icon.....
        OutlinedButton.icon(
          // style for outlinebutton...
          style: OutlinedButton.styleFrom(
            foregroundColor: const Color.fromARGB(255, 173, 159, 230),
          ),
          icon: const Icon(Icons.arrow_forward_ios),
          onPressed: startScreen,
          // it doesn't allow "child" but "label"
          label: const Text('Start Quiz'),
        ),
      ],
    ));
  }
}
