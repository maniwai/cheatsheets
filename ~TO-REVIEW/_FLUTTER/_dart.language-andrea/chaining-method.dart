void main() {
  ChainCalculator chainCalculator = ChainCalculator(5.0).add(10.0).subtract(5.0).subtract(2.0);
  print("Result: " + chainCalculator.result().toString());

  // cascade operator act like chain but we don't need to return this in the chain method.
  CascadeCalculator cascadeCalculator = CascadeCalculator(5.0)
    ..add(5.0)
    ..subtract(5.0)
    ..subtract(1.0);
  print("Result: " + cascadeCalculator.result().toString());
}

class ChainCalculator {
  double _accumulator = 0.0;

  ChainCalculator(double initVal) {
    this._accumulator = initVal;
  }

  ChainCalculator add(double val) {
    this._accumulator += val;
    return this;
  }

  ChainCalculator subtract(double val) {
    this._accumulator -= val;
    return this;
  }

  double result() {
    return this._accumulator;
  }
}

class CascadeCalculator {
  double _accumulator = 0;

  CascadeCalculator(double startValue) {
    this._accumulator = startValue;
  }

  void add(double val) {
    this._accumulator += val;
  }

  void subtract(double val) {
    this._accumulator -= val;
  }

  double result() {
    return this._accumulator;
  }
}
