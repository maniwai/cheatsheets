void main() {
  var hashTable = HashTable(7);
  print(hashTable);
}

class HashTable {
  HashTable(size) : _dataMap = List.filled(size, null);

  List<Node?> _dataMap;

  @override
  String toString() {
    var i = 0;
    while (i < _dataMap.length) {
      print(_dataMap[i]);
      i++;
    }
    return '${_dataMap.length}';
  }
}

class Node {
  Node(this.key, this.value);

  String key;
  int value;
  Node? next;
}
