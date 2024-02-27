import 'package:flutter/material.dart';
import '/models/Category.dart';
import '/models/Question.dart';

class DetailedView extends StatefulWidget {
  final Category category;

  const DetailedView({super.key, required this.category});

  @override
  _DetailedViewState createState() => _DetailedViewState();
}

class _DetailedViewState extends State<DetailedView>{
  late List<Question> questions;
  int currentIndex = 0;
  Color btnColorTrue = const Color.fromARGB(255, 48, 15, 54);
  Color btnColorFalse = const Color.fromARGB(255, 48, 15, 54);
  Map<int,bool> answers = {};

  @override
  void initState(){
    super.initState();
    questions = List.from(widget.category.questions)..shuffle();
  }

  void selectAnswer(bool userAnswer) {
    bool isCorrect = questions[currentIndex].answer == userAnswer;
    answers[currentIndex] = isCorrect;
    setState(() {
      // Update button colors to indicate correctness
      if (userAnswer) {
        // User selected "True"
        btnColorTrue = isCorrect ? Colors.green : Colors.red;
        btnColorFalse = const Color.fromARGB(255, 48, 15, 54); // Reset to default color
      } else {
        // User selected "False"
        btnColorFalse = isCorrect ? Colors.green : Colors.red;
        btnColorTrue = const Color.fromARGB(255, 48, 15, 54); // Reset to default color
      }
    });

    // Optionally, add a delay to show the color before moving to the next question
    Future.delayed(Duration(seconds: 1), () {
      if (currentIndex < questions.length - 1) {
        setState(() {
          currentIndex++;
          // Reset button colors here for the next question
          btnColorTrue = const Color.fromARGB(255, 48, 15, 54);
          btnColorFalse = const Color.fromARGB(255, 48, 15, 54);
        });
      } else {
        // Calculate the score and navigate to the score screen
        int score = answers.values
            .where((isCorrect) => isCorrect).length;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ScoreScreen(score: score, totalQuestions: questions.length),
          ),
        );
      }
    });
  }

  void goToNextQuestion() {
    if (currentIndex < questions.length - 1) {
      setState(() {
        currentIndex++;
        // Reset button colors for the next question
        btnColorTrue = const Color.fromARGB(255, 48, 15, 54);
        btnColorFalse = const Color.fromARGB(255, 48, 15, 54);
      });
    } else {
      // End of quiz, navigate to score screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ScoreScreen(
            score: answers.entries.where((entry) => questions[entry.key].answer == entry.value).length,
            totalQuestions: questions.length,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context){
    Question currentQuestion = questions[currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // Shadow color
                  spreadRadius: 10, // Spread radius
                  blurRadius: 10, // Blur radius
                  offset: Offset(0, 3), // Changes position of shadow
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10), // Apply rounding to the image
              child: Image.asset(
                widget.category.imageUrl,
                width: MediaQuery.of(context).size.width * 0.8, // Adjust the image size as needed
                height: 250, // Adjust the image height as needed
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              currentQuestion.question,
              style: TextStyle(fontSize: 20.0, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), // Match the button's border radius
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: btnColorTrue, // Dynamic background color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Button border radius
                    ),
                    elevation: 0, // Disable ElevatedButton's own elevation
                  ),
                  onPressed: () => selectAnswer(true),
                  child: const Text(
                    'True',
                    style: TextStyle(color: Colors.grey),
                  ),

                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: btnColorFalse, // Dynamic background color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Button border radius
                    ),
                    elevation: 0, // Disable ElevatedButton's own elevation
                  ),
                  onPressed: () => selectAnswer(false),
                  child: const Text(
                    'False',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ],
          )
          ,
        ],
      ),
    );
  }
}

class ScoreScreen extends StatelessWidget{
  final int score;
  final int totalQuestions;

  const ScoreScreen({super.key, required this.score, required this.totalQuestions});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Completed!'),
      ),
      body: Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20), // Spacing before the image
          Image.asset(
            'assets/images/score.png', // Path to your image asset
            width: 150,
            height: 150,
          ),
          const SizedBox(height: 20), // Spacing between the image and the score text
              Text(
                'Your Score: $score/$totalQuestions',
                style: const TextStyle(fontSize: 24, color: Colors.grey),
              ),
              const SizedBox(height: 20), // Spacing between the score text and the button
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), // Match the button's border radius
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // Shadow color
                      spreadRadius: 2, // Spread radius
                      blurRadius: 4, // Blur radius
                      offset: const Offset(0, 2), // Changes position of shadow
                    ),
                  ],
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.grey, backgroundColor: const Color.fromARGB(255, 48, 15, 54), // For the text color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Rounded corners
                    ),
                    elevation: 0, // Disable ElevatedButton's own elevation to rely on the Container's shadow
                  ),
                  onPressed: () {
                    // Navigate back to the categories screen
                    Navigator.popUntil(context, ModalRoute.withName('/'));
                  },
                  child: const Text(
                    'Return to Categories',
                    style: TextStyle(color: Colors.grey), // Set text color to grey
                  ),
                ),
              ),
            ],
          )

      ),
    );
  }
}