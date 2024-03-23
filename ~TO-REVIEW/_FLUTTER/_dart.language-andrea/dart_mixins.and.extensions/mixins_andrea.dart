/**
 * Mixins are classes we can extends "with" the with keywords
 * unlike classes, we can implements multiple mixins
 * Note: Mixins don't have constructors
 * Note: mixins can lead to name collision, ie: foo()
 */
///
void main() {
  final fish = Fish();
  fish.foo(); // bar 2
}

mixin Foo1 {
  void bar() => print('bar 1');
}
mixin Foo2 {
  void foo() => print('bar 2');
}

class Fish with Foo1, Foo2 {}