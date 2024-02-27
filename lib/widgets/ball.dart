class Ball {
  double x, y;
  double dx = 4, dy = -4; //direction and speed of the ball movement
  static const double radius = 15; // Ball radius

  Ball(this.x, this.y);

  void move(double screenWidth, double screenHeight) {
    x += dx;
    y += dy;
    // left or right edge collision
    if(x <= radius || x >= screenWidth - radius) {
      dx = -dx;
    }
    //top egde collision
    if (y <= radius) {
      dy = -dy;
    }
    //bottom edge
    if (y >= screenHeight - radius) {
      dy = -dy;
    }
  }
}