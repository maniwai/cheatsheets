// assert throw an exception in debug mode only
/**
 * assert is used in debug mode to notify developpers about wrong usage
 */
///
class PositiveInt {
  const PositiveInt(this.value) : assert(value >= 0, 'value can not be negative');
  final int value;
}

void signIn(String email, String password) {
  assert(email.isNotEmpty);
  assert(password.isNotEmpty);
}

void main() {
  // PositiveInt(-1);
  signIn('', '');
}
