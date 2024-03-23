void main() {}

class LinkedList<E> with Iterable {
  /** ----------------------------------------
   * properties
   * ----------------------------------------- */
  ///
  Node<E>? _head;
  Node<E>? _tail;
  int _length = 0;

  /** ----------------------------------------
   * getters & setters
   * ----------------------------------------- */
  ///
  @override
  int get length => _length;
  @override
  bool get isEmpty => _head == null;

  /// ----------------------------------------
  /// addFirst()
  /// -----------------------------------------
  Node addFirst(E value) {
    var node = Node(value);
    if (isEmpty) {
      _head = _tail = node;
    } else {
      node._next = _head;
      _head = node;
    }
    _length++;
    return node;
  }

  /** ----------------------------------------
   * addLast()
   * ----------------------------------------- */
  ///
  Node addLast(E value) {
    var node = Node(value);
    if (isEmpty) {
      _head = _tail = node;
    } else {
      _tail?._next = node;
      _tail = node;
    }
    _length++;
    return node;
  }

  /// ----------------------------------------
  /// removeFirst()
  /// -----------------------------------------
  removeFirst() {
    if (isEmpty || _head?._next == null) {
      _length = 0;
      return _head = _tail = null;
    } else {
      var second = _head!._next as Node<E>;
      _head?._next = null;
      _head = second;
      _length--;
      return second;
    }
  }

  /// ----------------------------------------
  /// removeLast()
  /// -----------------------------------------
  ///
  Node? removeLast() {
    if (isEmpty || _head?._next == null) {
      _length = 0;
      return _head = _tail = null;
    } else {
      var previous = _getPrevious(_tail);
      previous._next = null;
      _tail = previous;
      _length--;
      return previous;
    }
  }

  _getPrevious(Node? node) {
    var current = _head;
    while (current?._next != null) {
      if (current!._next == node) return current;
      current = current._next as Node<E>;
    }
    return null;
  }

  /// ----------------------------------------
  /// getAtIndex()
  /// -----------------------------------------
  Node? getAtIndex(int index) {
    if (index < 0 || index >= _length) return null;

    var current = _head;
    for (var i = 0; i < index; i++) {
      current = current?._next as Node<E>?;
    }
    return current;
  }

  /// ----------------------------------------
  /// setAtIndex()
  /// -----------------------------------------
  setAtIndex(int index, E value) {
    Node? node = getAtIndex(index);
    if (node != null) {
      node._value = value;
      return node;
    } else {
      return null;
    }
  }

  /// ----------------------------------------
  /// insertAtIndex()
  /// -----------------------------------------
  insertAtIndex(int index, E value) {
    if (index < 0 || index > _length) return false;

    if (index == 0) return addFirst(value);
    if (index == _length) return addLast(value);

    var node = Node(value);
    var previous = getAtIndex(index - 1);
    node._next = previous?._next;
    previous?._next = node;
    _length++;
    return true;
  }

  /// ----------------------------------------
  /// removeAtIndex()
  /// -----------------------------------------
  Node? removeAtIndex(int index) {
    if (index < 0 || index > _length) return null;

    if (index == 0) return removeFirst();
    if (index == _length) return removeLast();

    var current = getAtIndex(index - 1);
    var second = current?._next;

    current?._next = second?._next;
    second?._next = null;
    _length--;
    return second;
  }

  /// ----------------------------------------
  /// indexOf()
  /// -----------------------------------------
  int indexOf(E item) {
    var index = 0;
    var current = _head;
    while (current != null) {
      if (current._value == item) return index;
      current = current._next as Node<E>;
      index++;
    }
    return -1;
  }

  /// ----------------------------------------
  /// toArray()
  /// -----------------------------------------
  List<E?> toArray() {
    var list = List<E?>.filled(_length, null);
    var current = _head;
    var index = 0;
    while (current != null) {
      list[index++] = current._value;
      current = current._next as Node<E>;
    }
    return list;
  }

  /// ----------------------------------------
  /// reverse()
  /// -----------------------------------------
  reverse() {
    if (isEmpty) return;

    var first = _head;
    var second = _head?._next as Node<E>?;
    while (second != null) {
      var third = second._next as Node<E>?;
      second._next = first;
      first = second;
      second = third;
    }
    _tail = _head;
    _tail?._next = null;
    _head = first;
  }

  /// ----------------------------------------
  /// getKthFromTheEnd()
  /// -----------------------------------------
  getKthFromTheEnd(k) {
    if (isEmpty) return -1; // todo: throw exception
    var a = _head;
    var b = _head;
    for (int i = 0; i < k - 1; i++) {
      b = b?._next as Node<E>?;
      if (b == null) return -1; // todo: throw exception
    }
    while (b != _tail) {
      a = a?._next as Node<E>?;
      b = b?._next as Node<E>?;
    }
    return a?._value;
  }

  /// ----------------------------------------
  /// toString()
  /// -----------------------------------------
  @override
  String toString() {
    if (isEmpty) return 'List is empty, head: $_head, tail: $_tail, length: $_length';
    return '''
    --------------------------------
    Head   | value = ${_head?._value}, next = ${_head?._next?._value}
    Nodes  | ${_head.toString()}
    Length | $_length
    Tail   | value = ${_tail?._value}, next = ${_tail?._next?._value}
    --------------------------------
    ''';
  }

  @override
  Iterator<E> get iterator => _LinkedListIterator(this);
}

class Node<T> {
  /** ----------------------------------------
   * Constructor
   * ----------------------------------------- */
  ///
  Node(T value) : _value = value;
  /** ----------------------------------------
   * Parameters
   * ----------------------------------------- */
  ///
  T _value;
  Node? _next;

  /// ----------------------------------------
  /// toString()
  /// -----------------------------------------
  @override
  String toString() {
    if (_next == null) return '$_value';
    return '$_value -> ${_next.toString()}';
  }
}

class _LinkedListIterator<E> implements Iterator<E> {
  _LinkedListIterator(LinkedList<E> list) : _list = list;

  final LinkedList<E> _list;
  Node<E>? _currentNode;
  bool _firstPass = true;

  @override
  E get current => _currentNode!._value;

  @override
  bool moveNext() {
    // 1
    if (_list.isEmpty) return false;
    // 2
    if (_firstPass) {
      _currentNode = _list._head;
      _firstPass = false;
    } else {
      _currentNode = _currentNode?._next as Node<E>?;
    }
    // 3
    return _currentNode != null;
  }
}
