import 'dart:async';

void main() {
  out.listen((event) => print(event));
  out.listen((event) => print(event.toUpperCase()));

  add = 'hola';
}
// broadcast allow to have multiple listeners
StreamController<String> _controller = StreamController<String>.broadcast();
Stream<String> get out => _controller.stream;
void set add(event) => _controller.sink.add(event);
