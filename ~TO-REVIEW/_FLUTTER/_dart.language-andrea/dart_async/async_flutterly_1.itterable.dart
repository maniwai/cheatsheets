// https://www.youtube.com/watch?v=60UdftkluF8&list=PLptHs0ZDJKt_fLp8ImPQVc1obUJKDSQL7&index=22&ab_channel=Flutterly

void main() {
  var a = showNormal(3);
  print('a.first --> ${a.first}'); // note: it won't

  /**
   * "generator" (sync*) are lazy load, means it will perform only when its called;
   * "yield" is a special return that return the value as soon it find it (and stop the loop)
   */
  var b = showGenerated(3);
  print('b.first --> ${b.first}');
}

int sum(int a, int b) => a + b;

Iterable<int> showNormal(int n) {
  print('Normal started ---------------------');
  var list = <int>[];
  for (var i = 1; i <= n; i++) {
    print('i: $i');
    list.add(i);
  }
  print('Normal ended -----------------------');
  return list;
}

Iterable<int> showGenerated(int n) sync* {
  print('Generator started ------------------');
  for (var i = 1; i <= n; i++) {
    print('i: $i');
    yield i;
  }
  print('Generator ended --------------------');
}
