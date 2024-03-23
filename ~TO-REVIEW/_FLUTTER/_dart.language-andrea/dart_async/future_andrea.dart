// Future.value return the value
Future<String> fetchUserOrder1() => Future.value('Espresso');
// Future.error is usefull for debugging
Future<String> fetchUserOrder2() => Future.error(Exception('Out of milk'));

Future<void> main() async {
  print('program started');
  try {
    final order = await fetchUserOrder2();
    print(order);
  } catch (e) {
    print(e);
  } finally {
    print('Done');
  }
}
