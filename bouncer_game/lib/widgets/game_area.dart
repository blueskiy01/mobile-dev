import 'package:bouncer/widgets/player_tile.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:flutter/material.dart';
import '../controllers/game_controller.dart'; // Ensure this path matches your project structure
import 'dart:async';

import 'ball.dart';
import 'block.dart';

import 'dart:math';

class GameArea extends StatefulWidget {
  const GameArea({super.key});

  @override
  createState() => _GameAreaState();
}

class _GameAreaState extends State<GameArea> {
  late Ball ball;
  late Paddle paddle;
  List<Block> blocks = [];
  Timer? timer;
  late Size screenSize;
  bool isGameOver = false;
  bool isGameWon = false;
  double _opacity = 1.0;

  // Function to generate a random color
  Color getRandomColor() {
    Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256), // Red value
      random.nextInt(256), // Green value
      random.nextInt(256), // Blue value
    );
  }

  // Initialize a list to store random colors for blocks
  List<Color> blockColors = [];

  // Generate random colors for each block at the start of the game
  void initializeBlockColors(int numberOfBlocks) {
    blockColors.clear();
    for (int i = 0; i < numberOfBlocks; i++) {
      blockColors.add(getRandomColor());
    }
  }

  @override
  void initState() {
    super.initState();

    // Add accelerometer event listener here
    accelerometerEventStream().listen((AccelerometerEvent event) {
      setState(() {
        final screenWidth = screenSize.width;
        final screenOrientation = MediaQuery.of(context).orientation;

        double deltaX;
        if (screenOrientation == Orientation.portrait) {
          deltaX = event.x * 10; // For portrait orientation
        } else {
          deltaX = event.y * 10; // For landscape orientation
        }

        paddle.updatePosition(deltaX, screenWidth, screenOrientation);
      });
    });



    WidgetsBinding.instance.addPostFrameCallback((_) {
      resetGame();
    });
  }

  void resetGame() {
    setState(() {
      ball = Ball(200, 250); // Initial position
      ball.dy = 2;
      paddle = Paddle(150, 700); // Adjust based on screenSize in the build method
      blocks = _createBlocks(5, 5);
      isGameOver = false;
      isGameWon = false;
      _opacity = 1.0;

      initializeBlockColors(blocks.length); // Initialize block colors
      // Commenting out the accelerometerEvents listener for mouse movement testing
      // accelerometerEvents.listen((AccelerometerEvent event) {
      //   print("Accelerometer x:${event.x}");
      //   setState(() {
      //     final screenWidth = MediaQuery.of(context).size.width;
      //     double deltaX = event.x*10; // Sensitivity
      //     paddle.updatePosition(deltaX, screenSize.width);
      //   });
      // });
      timer?.cancel();
      timer = Timer.periodic(const Duration(milliseconds: 16), (Timer t) => updateGame());
    });
  }

  List<Block> _createBlocks(int rows, int cols) {
    List<Block> tempBlocks = [];
    double padding = 3; // Move the declaration here
    double startX = (screenSize.width - cols * (Block.width + padding)) / 2; // Calculate startX to center blocks
    double startY = 20;

    for (int row = 0; row < rows; row++) {
      for (int col = 0; col < cols; col++) {
        double x = startX + col * (Block.width + padding);
        double y = startY + row * (Block.height + padding);
        tempBlocks.add(Block(x, y));
      }
    }
    return tempBlocks;
  }

  void updateGame() {
    if (!isGameOver && !isGameWon) {
      setState(() {
        ball.move(screenSize.width, screenSize.height);

        if (GameLogic.checkBallPaddleCollision(ball, paddle)) {
          ball.dy = -ball.dy;
        }

        Block? hitBlock = GameLogic.checkBallBlocksCollision(ball, blocks);
        if (hitBlock != null) {
          ball.dy = -ball.dy;
          // Change the color of the hit block
          int index = blocks.indexOf(hitBlock);
          if (index != -1 && index < blockColors.length) {
            blockColors[index] = getRandomColor();
          }
        }

        blocks.removeWhere((block) => block.isHit);

        if (ball.y >= screenSize.height - Ball.radius) {
          isGameOver = true;
          timer?.cancel();
        } else if (blocks.isEmpty) {
          isGameWon = true;
          timer?.cancel();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size; // Update screenSize with current context size

    return Material(
      child: GestureDetector(
        onHorizontalDragUpdate: (details) {
          if (!isGameOver && !isGameWon) {
            final RenderBox renderBox = context.findRenderObject() as RenderBox;
            final localPosition = renderBox.globalToLocal(details.globalPosition);
            setState(() {
              paddle.x = (localPosition.dx - Paddle.width / 2).clamp(0.0, screenSize.width - Paddle.width);
            });
          }
        },
        child: Stack(
          children: [
            AnimatedOpacity(
              opacity: _opacity,
              duration: const Duration(seconds: 1),
              child: CustomPaint(
                painter: GamePainter(ball, paddle, blocks, blockColors), // Pass blockColors to the painter
                child: Container(),
              ),
            ),
            if (isGameOver || isGameWon)
              Center(
                child: InkWell(
                  onTap: resetGame,
                  child: Container(
                    margin: const EdgeInsets.all(20.0),
                    padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFF7986CB),
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: const Offset(0, 2), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Text(
                      isGameOver ? "You Lose! Tap to retry." : "You Win! Tap to retry.",
                      style: const TextStyle(fontSize: 24, color: Colors.white), // Adjust text color
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    if (timer != null) {
      timer?.cancel();
    }
    super.dispose();
  }
}

class GamePainter extends CustomPainter {
  final Ball ball;
  final Paddle paddle;
  final List<Block> blocks;
  final List<Color> blockColors; // Added blockColors parameter

  GamePainter(this.ball, this.paddle, this.blocks, this.blockColors);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Draw the ball
    paint.color = const Color(0xFFFF9800);
    canvas.drawCircle(Offset(ball.x, ball.y), Ball.radius, paint);

    // Draw the paddle with rounded edges
    paint.color = const Color(0xFF00BFFF); // A bright blue color reminiscent of outer space
    var paddleRRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(paddle.x, paddle.y, Paddle.width, Paddle.height),
      const Radius.circular(15), // Adjust this value for desired roundness
    );
    canvas.drawRRect(paddleRRect, paint);

    // Draw the blocks with rounded edges and random colors
    for (var i = 0; i < blocks.length; i++) {
      var block = blocks[i];
      if (!block.isHit && i < blockColors.length) { // Ensure index is within bounds
        paint.color = blockColors[i]; // Set color from blockColors list
        var blockRRect = RRect.fromRectAndRadius(
          Rect.fromLTWH(block.x, block.y, Block.width, Block.height),
          const Radius.circular(8), // Adjust this value for desired roundness
        );
        canvas.drawRRect(blockRRect, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
