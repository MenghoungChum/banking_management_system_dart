import '../bank_account.dart';

class BankService {
  final List<BankAccount> accounts = [];

  BankAccount? findAccount(String accountNumber) {
    for (final account in accounts) {
      if (account.accountNumber == accountNumber) {
        return account;
      }
    }
    return null;
  }

  void createAccount({
    required String accountNumber,
    required String ownerName,
    double initialBalance = 0.0,
  }) {
    if (accountNumber.trim().isEmpty || ownerName.trim().isEmpty) {
      print('Account number and owner name cannot be empty.');
      return;
    }

    if (initialBalance < 0) {
      print('Initial balance cannot be negative.');
      return;
    }

    if (findAccount(accountNumber) != null) {
      print('Account with this number already exists.');
      return;
    }

    final account = BankAccount(
      accountNumber: accountNumber,
      ownerName: ownerName,
      balance: initialBalance,
    );

    accounts.add(account);
    print(
      'Account created successfully: $accountNumber, Owner: $ownerName, Initial Balance: \$${initialBalance.toStringAsFixed(2)}',
    );
  }

  void deposit(String accountNumber, double amount) {
    final account = findAccount(accountNumber);
    if (account == null) {
      print('Error: Account not found.');
      return;
    }
    if (!amount.isFinite || amount <= 0) {
      print('Error: Deposit amount must be positive.');
      return;
    }
    account.balance += amount;
    print('Deposit successful!');
    account.checkBalance();
  }

  void withdraw(String accountNumber, double amount) {
    final account = findAccount(accountNumber);
    if (account == null) {
      print('Error: Account not found.');
      return;
    }
    if (!amount.isFinite || amount <= 0) {
      print('Error: Withdrawal amount must be positive.');
      return;
    }
    if (amount > account.balance) {
      print('Error: Insufficient balance.');
      return;
    }
    account.balance -= amount;
    print('Withdrawal successful!');
    account.checkBalance();
  }

  void displayAllAccount(){
    if (accounts.isEmpty) {
      print('No accounts available.');
      return;
    }

    for (final account in accounts) {
      account.displayInfo();
    }
  }
}
