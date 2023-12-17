class LinkedList {
    constructor(value) {
        this.head = new Node(value);
        this.tail = this.head;
        this.length = 1;
    }
    push(value) {
        const newNode = new Node(value)
        if (!this.head) {
            this.head = newNode
            this.tail = newNode
        } else {
            // we first link our last node to the new node
            this.tail.next = newNode
            // then we move the tail cursor to the new node
            this.tail = newNode
        }
        this. length++
        return this
    }
    unshift(value) {}
    insert(index, value) {}
}
class Node {
    constructor(value) {
        this.value = value;
        this.next = null;
    }
}
let myLinkedList = new LinkedList(4);