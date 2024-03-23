void main() {
  const emails = [
    'abc@abc.com',
    'me@example.com',
    'john@gmail.com',
    'katy@yahoo.com',
  ];
  const knownDomains = ['gmail.com', 'yahoo.com'];
  final unknownDomains = getUnknownDomains(emails, knownDomains);
  print(unknownDomains);
}

// functional operator allow to chain operations
Iterable<String> getUnknownDomains(List<String> emails, List<String> knownDomains) => emails
  //
  ..map((email) => email.split('@').last)
  ..where((domain) => !knownDomains.contains(domain));
