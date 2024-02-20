import 'package:flutter/material.dart';

class ScoreView extends StatelessWidget {
  final int correctAnswers;
  final int totalQuestions;

  const ScoreView({super.key, required this.correctAnswers, required this.totalQuestions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Score'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Your Score',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Correct Answers: $correctAnswers / $totalQuestions',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Incorrect Answers: ${totalQuestions - correctAnswers} / $totalQuestions',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Navigate back to the main page
              },
              child: const Text('Return to Main Page'),
            ),
          ],
        ),
      ),
    );
  }
}
