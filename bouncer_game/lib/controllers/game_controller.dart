import 'package:flutter/material.dart';
import '../widgets/ball.dart';
import '../widgets/player_tile.dart';
import '../widgets/block.dart';

class GameLogic {
  // Check if the ball collides with the paddle
  static bool checkBallPaddleCollision(Ball ball, Paddle paddle) {
    Rect ballRect = Rect.fromCircle(center: Offset(ball.x, ball.y - 25), radius: Ball.radius);
    Rect paddleRect = Rect.fromLTWH(paddle.x, paddle.y - Paddle.height, Paddle.width, Paddle.height);

    return ballRect.overlaps(paddleRect);
  }

  // Check if the ball collides with any block
  static Block? checkBallBlocksCollision(Ball ball, List<Block> blocks) {
    Rect ballRect = Rect.fromCircle(center: Offset(ball.x, ball.y), radius: Ball.radius);

    for (Block block in blocks) {
      Rect blockRect = Rect.fromLTWH(block.x, block.y, Block.width, Block.height);
      if (ballRect.overlaps(blockRect) && !block.isHit) {
        block.isHit = true; // Mark the block as hit
        return block; // Returning the first block hit
      }
    }
    return null; // No collision with blocks
  }

// Add more game logic functions as needed
}