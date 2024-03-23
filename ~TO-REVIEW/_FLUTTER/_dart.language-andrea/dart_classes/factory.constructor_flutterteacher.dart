/// https://www.youtube.com/watch?v=L-lYqxhZSV4&ab_channel=FlutterTeacher
// Exemple 1
class Test {
  Test() : a = 5;
  int a = 10;

  /** -------------------------------------------------
   * Factory Constructor
   * they can't access members of the class
   * they can't access to this keyword
   * they must return an instance explicitly
   * they can generates instance of current or sub-class
   * -------------------------------------------------- */
  ///
  factory Test.foo() {
    // a = 5; // wont compile
    return Test();
  }
}

// Exemple 2
class Father {
  Father(int a);
  factory Father.getFather() => Father(3);
  factory Father.getSon() => Son();
}

class Son extends Father {
  Son() : super(10);
}
