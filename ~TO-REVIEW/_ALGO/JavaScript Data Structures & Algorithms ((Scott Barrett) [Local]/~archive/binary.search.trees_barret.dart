void main() {
  var myBST = new BinarySearchTree();

  myBST.insert(47);
  myBST.insert(21);
  myBST.insert(76);

  print(myBST.contains(55));
}

class Node {
  Node(this.value);

  int value;
  Node? left;
  Node? right;
}

class BinarySearchTree {
  Node? root;

  bool insert(int value) {
    Node newNode = new Node(value);
    if (root == null) {
      root = newNode;
      return true;
    }
    Node temp = root!;

    while (true) {
      if (newNode == temp.value) return false;
      if (newNode.value < temp.value) {
        if (temp.left == null) {
          temp.left = newNode;
          return true;
        }
        temp = temp.left!;
      } else {
        if (temp.right == null) {
          temp.right = newNode;
          return true;
        }
        temp = temp.right!;
      }
    }
  }

  bool contains(int value) {
    Node? temp = root!;

    while (temp != null) {
      if (value < temp.value) {
        temp = temp.left;
      } else if (value > temp.value) {
        temp = temp.right;
      } else {
        return true;
      }
    }
    return false;
  }
}
