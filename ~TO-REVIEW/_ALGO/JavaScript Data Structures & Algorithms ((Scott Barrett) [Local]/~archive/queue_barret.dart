void main() {
  var queue = new Queue();
  queue.enqueue(1);
  queue.enqueue(2);
  queue.enqueue(3);

  var test = queue.dequeue();

  print(test);
}

class Queue {
  Node? _first;
  Node? _last;
  int _length = 0;

  bool get isEmpty => _first == null;

  enqueue(value) {
    Node node = new Node(value);

    if (isEmpty)
      _first = _last = node;
    else {
      _last?._next = node;
      _last = node;
    }
    _length++;
  }

  dequeue() {
    if (isEmpty)
      return null;
    else {
      var temp = _first;
      _first = _first?._next;
      temp?._next = null;
      _length--;
      return temp;
    }
  }

  @override
  String toString() {
    if (isEmpty) return 'List is empty, head: $_first,  length: $_length';
    return '''
    --------------------------------
    Head   | value = ${_first?._value}, next = ${_first?._next?._value}
    Nodes  | ${_first.toString()}
    Length | $_length
    --------------------------------
    ''';
  }
}

class Node {
  int? _value;
  Node? _next;

  Node(this._value);

  @override
  String toString() {
    if (_next == null) return '$_value';
    return '$_value -> ${_next.toString()}';
  }
}
