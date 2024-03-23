// "for" version
Future<int> sumStream1(Stream<int> stream) async {
  var sum = 0;
  await for (var value in stream) {
    sum += value;
  }
  return sum;
}
// "reduce" version
Future<int> sumStream2(Stream<int> stream) async => stream.reduce((previous, element) => previous + element);

void main() async {
  final stream = Stream<int>.fromIterable([1, 2, 3, 4]);
  final sum = await sumStream2(stream);
  print(sum);
}
 