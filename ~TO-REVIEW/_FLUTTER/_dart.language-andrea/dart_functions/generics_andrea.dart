void main() {
  const l1 = [1, 3, 5];

  // problem: doubleItems takes only List<int>
  // and only perform single operation: item * 2
  final doubles = doubleItems(l1);
  print(doubles);

  // we use anonymous function with "transform1" to perform the operation
  final square = transform(l1, (x) => x * x);
  print(square);

  const l2 = [1.6, 3.7, 5.7];
  // we can use generics to specify type at runtime
  final toDouble = convert<int, double>(l1, (x) => x.toDouble());
  final toInt = convert<double, int>(l2, (x) => x.toInt());
  print(toDouble);
  print(toInt);
}

List<int> doubleItems(List<int> items) {
  var result = <int>[];
  for (var item in items) {
    result.add(item * 2);
  }
  return result;
}

List<int> transform(List<int> items, int Function(int) func) {
  var result = <int>[];
  for (var item in items) {
    result.add(func(item)); // we delegate the operation to a function argument
  }
  return result;
}

List<R> convert<T, R>(List<T> items, R Function(T) func) {
  var result = <R>[];
  for (var item in items) {
    result.add(func(item)); // we delegate the operation to a function argument
  }
  return result;
}