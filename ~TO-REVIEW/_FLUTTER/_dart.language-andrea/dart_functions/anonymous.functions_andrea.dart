// we defining an alias by giving a name to a function type to be reused
typedef MyAlias = String Function(String);
void welcome(MyAlias greet, String name) {
  print(greet(name));
}
void main() {
  sayHi(String name) => 'hi, $name';
  welcome(sayHi, 'Mani');
}
