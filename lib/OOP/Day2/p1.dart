void main() {
  BankAccount ac1 = BankAccount();
  BankAccount ac2 = BankAccount();

  ac1.accountName = 'Rafi';
  ac1.accountNumber = 01;
  ac1.balance = 500;

  ac2.accountName = 'Rakib';
  ac2.accountNumber = 02;
  ac2.balance = 1000;


  ac2.transferAmount(500, ac1);

  print(ac1.balance);
  print(ac2.balance);
}


class BankAccount{
  int? accountNumber;
  String? accountName;
  double balance = 0;

  bool withDrawAmount(double amount) {
    if (balance > amount) {
      balance -= amount;
      return true;
    } else {
      return false;
    }
  }

  bool deposit(double amount) {
    if (amount> 0) {
      balance += amount;
      return true;
    } else {
      return false;
    }
  }

  bool transferAmount(double amount, BankAccount destinationAccount) {
    if (withDrawAmount(amount)) {
      destinationAccount.deposit(amount);
      return true;
    } else {
      return false;
    }
  }
}

