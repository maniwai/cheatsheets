// generics allow to use different type arguments at runtime.
void main() {
  // here with "int"
  final stack = Stack<int>();
  stack.push(1);
  stack.push(2);
  print(stack);
  // here with "String"
  final names = Stack<String>();
  names.push('Andrea');
  names.push('Alice');
  print(names);
}

class Stack<T> {
  final List<T> _items = [];
  void push(T item) => _items.add(item);
  @override
  String toString() => _items.toString();
}

