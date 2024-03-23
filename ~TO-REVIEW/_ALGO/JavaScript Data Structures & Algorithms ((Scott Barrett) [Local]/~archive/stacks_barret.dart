void main() {
  var stack = Stack();
  stack.push(1);
  stack.push(2);
  stack.push(3);
  stack.pop();
  stack.pop();
  stack.pop();
  stack.pop();
  print(stack);
}

class Stack {
  Node? _top;
  int _length = 0;

  bool get isEmpty => _top == null;

  Node push(value) {
    var node = Node(value);
    if (isEmpty)
      _top = node;
    else {
      node._next = _top;
      _top = node;
    }
    _length++;
    return node;
  }

  Node? pop() {
    if (isEmpty)
      return null;
    else {
      var temp = _top;
      _top = _top?._next;
      temp?._next = null;
      _length--;
      return temp;
    }
  }

  @override
  String toString() {
    if (isEmpty) return 'List is empty, head: $_top,  length: $_length';
    return '''
    --------------------------------
    Head   | value = ${_top?._value}, next = ${_top?._next?._value}
    Nodes  | ${_top.toString()}
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
