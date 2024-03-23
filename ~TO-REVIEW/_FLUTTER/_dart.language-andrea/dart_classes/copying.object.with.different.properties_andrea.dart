/**
 * Copying object
 * we should create immutable classes with "final" variables because its more predictable
 * but how can we make a copy of an immutable object, and change some properties?
 */
///
void main() {
  const credentials = Credentials();
  print(credentials);
  final updated = credentials.copyWith(email: 'second@example.com', password: 'two');
  print(updated);
}

class Credentials {
  const Credentials({this.email = 'first@example.com', this.password = 'one'});
  final String email;
  final String password;

  // set password(pass) => password = pass;

  Credentials copyWith({
    String? email,
    String? password,
  }) {
    return Credentials(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  String toString() => 'Credentials($email, $password)';
}
