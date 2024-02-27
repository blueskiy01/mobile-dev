<<<<<<< HEAD
# Bouncer - Flutter Game Project

Bouncer is a mobile game developed using Flutter that demonstrates how to work with phone hardware, specifically the accelerometer.  
The game is a simplified version of the classic bouncing ball game from the 90s.

## Objective

The main objective of this project is to create a fully functional mobile game where the player controls a tile using the phone's accelerometer to prevent a ball from touching the bottom of the screen while destroying all blocks.

## Rules of the Game

- The ball moves linearly and changes direction when it hits a wall, block, or the player's tile. The angle of incidence equals the angle of reflection.
- All blocks disappear when hit by the ball.
- The game ends when the ball touches the bottom of the screen or all blocks are destroyed.
- The player's tile moves according to the phone's tilting, and it cannot go off the screen's dimensions.

## Features

- Accurate accelerometer control for player's tile movement.
- Realistic ball physics with collision detection.
- Dynamic block destruction and win/loss conditions.

## Requirements 
- Flutter sdk 
- Dart sdk
- Android Studio
- Xcode

## Setup

1. Clone this repository to your local machine.
2. Ensure you have Flutter and Dart installed on your machine.
3. Run `flutter pub get` to install dependencies.
4. Connect a physical device or set up an emulator for testing.
5. Run the app using `flutter run`.

## Project Structure

The project follows a structured approach with separate files for different components:

- `lib/main.dart`: Main entry point of the application.
- `lib/screens/game_screen.dart`: Game screen widget with game logic and UI elements.
- `lib/widgets/player_tile.dart`: Widget representing the player's tile.
- `lib/widgets/ball.dart`: Widget representing the bouncing ball.
- `lib/widgets/block.dart`: Widget representing the blocks.

## Dependencies

- `sensors_plus`: Used for accessing accelerometer data.
## Screenshots


## Contributor
[blueskiy](github.com/blueskiy01)

=======
## Installation
To install Dart on your machine, follow the instructions on the [official website](https://dart.dev/get-dart).

## Development
This program was created using [Dart](https://dart.dev/).

## How to run the programs
To run the program use the command (whilst you are in the folder of the program):
```console
$ dart filename.dart
```

## Topics
[Intro](https://github.com/01-edu/public/tree/master/subjects/mobile-dev/intro)  
[Variables](https://github.com/01-edu/public/blob/master/subjects/mobile-dev/variables/README.md)  
[Data Structures](https://github.com/01-edu/public/blob/master/subjects/mobile-dev/data-structures/README.md)  
[Plain Sum](https://github.com/01-edu/public/blob/master/subjects/mobile-dev/plain-sum/README.md)  
[Name Required Sum](https://github.com/01-edu/public/blob/master/subjects/mobile-dev/named-required-sum/README.md)  
[Name Optional Sum](https://github.com/01-edu/public/blob/master/subjects/mobile-dev/named-optional-sum/README.md)  
[Optional Sum ](https://github.com/01-edu/public/blob/master/subjects/mobile-dev/optional-sum/README.md)  
[Max Num](https://github.com/01-edu/public/blob/master/subjects/mobile-dev/max-num/README.md)      
[Person](https://github.com/01-edu/public/blob/master/subjects/mobile-dev/person/README.md)  
[Circle](https://github.com/01-edu/public/blob/master/subjects/mobile-dev/circle/README.md)  
[University](https://github.com/01-edu/public/blob/master/subjects/mobile-dev/university/README.md)  
[Student](https://github.com/01-edu/public/blob/master/subjects/mobile-dev/student/README.md)  
>>>>>>> origin/main
