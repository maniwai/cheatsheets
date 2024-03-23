/**
 * extension allow to add functionality to classes
 * this is usefull to add functionality to external classes (from packages)
 * note: we need to give a name to be able to import in different file.
 */
///
extension myParsing on String {
  int? toIntOrNull() => int.tryParse(this);
}

void main() {
  var convert = '123'.toIntOrNull();
  print(convert);
}
