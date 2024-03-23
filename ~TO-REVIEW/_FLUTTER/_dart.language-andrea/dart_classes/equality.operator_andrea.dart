// exemple 1
import 'package:equatable/equatable.dart';

void main() {
  // two object with same signature(hasCode) are not equal by default
  print(Point1(0, 0) == Point1(0, 0)); // false
  // we need to override equality operator (==) to tell how to evaluate
  print(Point2(0, 0) == Point2(0, 0));
  // we can override any operator as well
  print(Point3(1, 1) + Point3(2, 0));
  // we can use equitable package to override == and hasCode for us
  print(Point4(0, 0) == Point4(0, 0));
}

class Point1 {
  const Point1(this.x, this.y);
  final int x;
  final int y;
}

class Point2 {
  const Point2(this.x, this.y);
  final int x;
  final int y;

  @override
  bool operator ==(Object other) {
    // operator overload
    if (other is Point2) {
      // we can access other.x because of the "is" operator (the variable is "promoted")
      return x == other.x && y == other.y;
    } else {
      return false;
    }
  }
}

// exemple 2: using "covariant"
class Point3 {
  const Point3(this.x, this.y);
  final int x;
  final int y;

  @override
  String toString() => 'Point($x, $y)';
  // "covariant" restrict the type of an argument
  // now, the "if" statement is not needed.
  @override
  bool operator ==(covariant Point3 other) {
    return x == other.x && y == other.y;
  }
  Point3 operator +(Point3 other) {
    return Point3(x + other.x, y + other.y);
  }
}

// exemple 3: using package "equitable"
// when we override == operator "we must" also override "hashcode" methode
// but we should use external packages like "equitable"
// note: Only use Equatable with immutable classe (all "props" should be "final")
class Point4 extends Equatable {
  const Point4(this.x, this.y);
  final int x;
  final int y;

  // "props" will override == and hasCode() (under the hood)
  @override
  List<Object> get props => [x, y];
}
