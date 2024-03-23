// best practice: use async/await instead of then()
void main() async {
  // we need to specify async keyword when we are using await inside a function
  /**
   * Then() Version
   */
  fetchOrderUsingThen()
      .then((order) => print('OrderUsingThen: is ready: $order'))
      .catchError((error) => print(error))
      .whenComplete(() => print('OrderUsingThen: Done'));
  /**
   * Await() Version
   */
  try {
    final order = await fetchOrderUsingAwait();
    print(order);
  } catch (e) {
    print(e);
  } finally {
    print('Done');
  }
}

Future<String> fetchOrderUsingThen() => Future.delayed(
      Duration(seconds: 2),
      () => throw Exception('out of milk'),
    );

Future<String> fetchOrderUsingAwait() => Future.delayed(
      Duration(seconds: 2),
      () => throw Exception('out of milk'),
    );
