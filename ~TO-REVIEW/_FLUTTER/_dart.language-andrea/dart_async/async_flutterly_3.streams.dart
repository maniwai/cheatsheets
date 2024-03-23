import 'dart:async';

void main() async {
  // ".listen" is similar to ".then" but for Stream.from
  Stream.periodic(const Duration(seconds: 1), (x) => x).listen(print);

  Stream.fromFutures([Future(() => 'a'), Future(() => 'b'), Future(() => 'c')]).listen(print);

  /**
   * Creating a Stream from stratch
   */
  // 1. create a Stream controller
  StreamController streamController = StreamController<int>.broadcast(); // broadcast allow multiple subscription
  // 3. subscribe to the Stream
  var streamSubscription1 = streamController.stream.listen(print); // listen return a StreamSubscription
  var streamSubscription2 = streamController.stream.listen(print); // listen return a StreamSubscription
  // 2. add streams
  var value = 0;
  Timer.periodic(Duration(seconds: 1), (timer) {
    // we always need to implement termination of the Stream
    if (value == -5) {
      timer.cancel();
      streamController.close();
    } else {
      streamController.add(value--);
    }
  });
  print(streamSubscription1);
  print(streamSubscription2);

  // await for stream to complete
  var min = 0;
  // note: we can alternativly use: "await streamController.stream.forEach()"
  await for (var value in streamController.stream) {
    min = (value < min) ? value : min;
  }
  print('Min value is --> $min');

  asyncGenerator().listen(print);
}

// we can use async generator with "async*" and "yield" the return value
Stream<int> asyncGenerator() async* {
  for (var i = 99; i > 95; i--) {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield i;
  }
}
