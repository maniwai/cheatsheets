/**
 * Iterable and Stream similarity
 * + they can be iterated with a for loop
 * + then can be created with generator functions
 * + they share many methods to process and modify items
 * - But Iterables are sunchronous, and Streams are asynchronous
 */
///
Future<int> sumStream(Stream<int> stream) async => stream.reduce((previous, element) => previous + element);

/**
 * Stream generators
 * allow to emit multiple values over time inside a function.
 * Stream generators are also called "asynchronus generator"
 */
///
Stream<int> countStream(int n) async* {
  for (var i = 1; i <= n; i++) {
    await Future.delayed(Duration(seconds: 1));
    print(i);
    yield i; // we can call yield multiple times to generate a Stream
  }
}

// synchronous version with Iterable generation, also called "synchronous generator"
Iterable<int> count(int n) sync* {
  for (var i = 1; i <= n; i++) {
    yield i;
  }
}

void main() async {
  final stream = countStream(4);
  final sum = await sumStream(stream);
  print('Sum--> $sum');
}
