abstract class InterfaceA {
  void a();
}
abstract class InterfaceB {
  void b();
}
// using "implements", we need to implement all the methods
class AB implements InterfaceA, InterfaceB {
  @override
  void a() {}

  @override
  void b() {}
}
