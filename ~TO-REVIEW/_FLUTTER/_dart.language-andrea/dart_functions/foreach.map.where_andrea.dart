void main() {
  const list = <int>[1, 2, 3, 4];
  /* -------
   forEach()
  ---------- */
  list.forEach(print);
  /* -------
   map()
  ---------- */
  // note: map return a type Itterable<T>, we can convert to a List with toList()
  final List<int> doubles = list.map((x) => x * 2).toList();
  print(doubles);
  /* -------
   where()
  ---------- */
  // reduce the list when evaluate to true
  final even = list.where((element) => element % 2 == 0);
  print(even);
}
