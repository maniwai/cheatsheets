void main() {
  var list = new DoublyLinkedList();
  list.addLast(1);
  list.addLast(2);
  list.addLast(3);

  list.removeAtIndex(1);
  print(list);
}

class Node {
  int _value;
  Node? _next;
  Node? _prev;

  Node(this._value);

  @override
  String toString() {
    if (_next == null) return '$_value';
    return '$_value -> ${_next.toString()}';
  }
}

class DoublyLinkedList {
  Node? _head;
  Node? _tail;
  int _length = 0;

  bool get isEmpty => _head == null;
  bool get isSingle => _head?._next == null;

  addLast(value) {
    var node = new Node(value);
    if (isEmpty)
      _head = _tail = node;
    else {
      _tail?._next = node;
      node._prev = _tail;
      _tail = node;
    }
    _length++;
  }

  addFirst(value) {
    var node = new Node(value);

    if (isEmpty)
      _head = _tail = node;
    else {
      _head?._prev = node;
      node._next = _head;
      _head = node;
    }
    _length++;
  }

  removeLast() {
    if (isEmpty) return null;

    var temp = _tail;
    if (isSingle)
      _head = _tail = null;
    else {
      _tail = temp!._prev;
      _tail?._next = null;
      temp._prev = null;
    }

    _length--;
    return temp;
  }

  removeFirst() {
    if (isEmpty) return null;

    var temp = _head;

    if (isSingle)
      _head = _tail = null;
    else {
      _head = _head!._next;
      _head!._prev = null;
      temp!._next = null;
    }
    _length--;
    return temp;
  }

  getAtIndex(index) {
    if (index < 0 || index >= _length) return null;

    var temp;

    if (index < _length / 2) {
      temp = _head;
      for (var i = 0; i < index; i++) {
        temp = temp._next;
      }
    } else {
      temp = _tail;
      for (var i = _length - 1; i > index; i--) {
        temp = temp._prev;
      }
    }
    return temp;
  }

  setAtIndex(index, value) {
    Node? temp = getAtIndex(index);

    if (temp != null) {
      temp._value = value;
      return true;
    } else
      return false;
  }

  insertAtIndex(index, value) {
    if (index < 0 || index > _length) return false;
    if (index == 0) {
      addFirst(value);
      return true;
    }
    if (index == _length) {
      addLast(value);
      return true;
    }
    var node = new Node(value);
    var before = getAtIndex(index - 1);
    var after = before._next;
    node._prev = before;
    node._next = after;
    before._next = node;
    after._prev = node;
    _length++;
    return true;
  }

  removeAtIndex(index) {
    if (index < 0 || index >= _length) return null;

    if (index == 0) return removeFirst();
    if (index == _length) return removeLast();

    Node temp = getAtIndex(index);
    var prev = temp._prev;
    var next = temp._next;
    prev?._next = next;
    next?._prev = prev;
    temp._next = temp._prev = null;
    _length--;
    return temp;
  }

  @override
  String toString() {
    if (isEmpty) return 'List is empty, head: $_head, tail: $_tail, length: $_length';
    return '''
    --------------------------------
    Head   | value = ${_head?._value}, next = ${_head?._next?._value}, prev = ${_head?._prev?._value}
    Nodes  | ${_head.toString()}
    Length | $_length
    Tail   | value = ${_tail?._value}, next = ${_tail?._next?._value}, prev = ${_tail?._prev?._value}
    --------------------------------
    ''';
  }
}
