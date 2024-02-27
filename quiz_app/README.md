# quiz_app
Quizz App is a mobile application developed in Flutter that allows users to select a category and answer true or false questions related to the selected category.

## Features

- Select from 5 different categories: History, Culture, Math, Geography, and more.
- Answer at least 10 questions in each category.
- View images and names of categories on the main page.
- See corresponding images and questions for selected categories.
- Receive immediate feedback on the correctness of answers.
- View overall quiz score at the end.
- Return to the main page to start a new quiz.

## Screenshots

![Main Page](screenshots/main_page.png)
![Detailed View](screenshots/detailed_view.png)
![Score View](screenshots/score_view.png)

### Question

The `Question` model represents a single true/false question.

```dart
class Question {
  String question;
  bool answer;

  Question(this.question, this.answer);
}
```

### Category

The `Category` model represents a category of questions.

```dart
class Category {
  String name;
  String imageUrl;
  List<Question> questions;

  Category(this.name, this.imageUrl, this.questions);
}
```

## Installation

To run the app locally, follow these steps:

1. Clone this repository.
2. Open the project in Android Studio or Visual Studio Code.
3. Run `flutter pub get` to install dependencies.
4. Run the app on an emulator or physical device using `flutter run`.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
```