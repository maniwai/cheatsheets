/**
 * Generic Type Constraints
 * we can constraint a type from external packages to be treated as generic
 * and we can extends generic to constraint types
 * ie: we can use both int or double with there parent type num
 */
///
extension IterableX<T extends num> on Iterable<T> { 
  T mySum() => reduce((value, element) => (value + element) as T);
}

void main() {
  final sum = [1.1, 2.2, 3.3].mySum();
  print(sum);
}
