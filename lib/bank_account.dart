class BankAccount {
  String accountNumber;
  String ownerName;
  double balance;
  BankAccount({
    required this.accountNumber,
    required this.ownerName,
    this.balance=0.0,
  });


  void checkBalance(){
    print('Current Balance: \$${balance.toStringAsFixed(2)}');
  }

  void displayInfo() {
  print('\n===== ACCOUNT INFORMATION =====');
  print('Account Number: $accountNumber');

  print('Owner Name: $ownerName');
  print('Balance: \$${balance.toStringAsFixed(2)}');
  print('================================');
  }
}

