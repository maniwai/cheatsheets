class Point {
  const Point(this.x, this.y);
  final int x;
  final int y;

  // toString()
  @override
  String toString() => 'Point($x, $y)';
}

void main() {
  final point = Point(2, 3);
  print(point);
}
