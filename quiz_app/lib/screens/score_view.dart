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
            const SizedBox(height: 10),
            Text(
              'Incorrect Answers: ${totalQuestions - correctAnswers} / $totalQuestions',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            Image.asset(
              'assets/images/score.png',
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Return to Main Page'),
            ),
          ],
        ),
      ),
    );
  }
}
