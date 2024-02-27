class Paddle {
  double x, y;
  static const double width = 100, height = 20; // Assuming these are your paddle dimensions
  Paddle(this.x, this.y);

  void updatePosition(double deltaX, double screenWidth) {
    x += deltaX;

    // Ensure the paddle does not move beyond the screen bounds
    if (x < 0) {
      x = 0;
    } else if (x > screenWidth - width) {
      x = screenWidth - width;
    }
  }
}