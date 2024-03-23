class BankAccount {
  String accountHolder;
  double balance;

  // Constructor initializing with Initializer List syntax
  BankAccount({required String accountHolder, double balance = 0})
      : accountHolder = accountHolder,
        balance = balance;

  // Constructor initializing with this. shorthand syntax
  BankAccount.shorthand({required this.accountHolder, this.balance = 0});

  void deposit(double amount) {
    balance += amount;
  }

  bool withdraw(double amount) {
    if (balance > amount) {
      balance -= amount;
      return true;
    }
    return false;
  }
}

void main() {
  final bankAccount = BankAccount(accountHolder: 'Mani', balance: 100);
  print(bankAccount.balance);
}
