class Block {
  double x, y;
  bool isHit = false; // To track if the block has been hit
  static const double width = 80, height = 30; // Block dimensions

  Block(this.x, this.y);

// Add functionality as needed, like handling collision with the ball
}