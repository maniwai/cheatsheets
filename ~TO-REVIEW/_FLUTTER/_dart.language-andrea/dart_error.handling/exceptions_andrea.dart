void main() {
  // 2. we "catch" exception
  try {
    final fraction = Fraction(3, 0);
    print(fraction);
    // we can chain exception type by using "on"
  } on UnsupportedError catch (e) {
    print(e);
    rethrow; // will rethrow the original exception
  } finally {
    print('this will always execute after an exception');
  }
}

class Fraction {
  Fraction(this.numerator, this.denominator) {
    if (denominator == 0) {
      // 1. we "throw" exceptions
      throw UnsupportedError('division by zero');
    }
  }
  final int numerator;
  final int denominator;

  double get value => numerator / denominator;
}