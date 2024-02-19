import 'dart:math';

const double PI = 3.14;

class Circle {
  double x = 0.0;
  double y = 0.0;
  double radius = 0.0;

 // Constructor
 Circle(this.x, this.y, this.radius);

 double get area => PI * radius * radius;
 double get perimeter => 2 * PI * radius;
 double get rightMostCoordinate => x + radius;
 double get leftMostCoordinate => x - radius;
 double get highestCoordinate => y + radius;
 double get lowestCoordinate => y - radius;

}