
import 'dart:io';
import 'services/bank_service.dart';

void main() {
  final bank = BankService();

  while (true) {
    print('\n========== BANKING SYSTEM ==========');
    print('1. Create Account');
    print('2. Deposit Money');
    print('3. Withdraw Money');
    print('4. Check Balance');
    print('5. Display All Accounts');
    print('6. Exit');
    print('====================================');

    stdout.write('Enter your choice: ');
    final choice = stdin.readLineSync()?.trim();

    switch (choice) {
      case '1':
        createAccountMenu(bank);
        break;

      case '2':
        depositMenu(bank);
        break;

      case '3':
        withdrawMenu(bank);
        break;

      case '4':
        checkBalanceMenu(bank);
        break;

      case '5':
        bank.displayAllAccount();
        break;

      case '6':
        print('Thank you for using Banking System!');
        return;

      default:
        print('Invalid choice. Please try again.');
    }
  }
}

void createAccountMenu(BankService bank) {
  stdout.write('Enter account number: ');
  final accountNumber = stdin.readLineSync()?.trim() ?? '';

  stdout.write('Enter owner name: ');
  final ownerName = stdin.readLineSync()?.trim() ?? '';

  final initialBalance = readAmount('Enter initial balance: ');

  if (initialBalance == null) {
    print('Invalid amount.');
    return;
  }

  bank.createAccount(
    accountNumber: accountNumber,
    ownerName: ownerName,
    initialBalance: initialBalance,
  );
}

void depositMenu(BankService bank) {
  stdout.write('Enter account number: ');
  final accountNumber = stdin.readLineSync()?.trim() ?? '';

  final amount = readAmount('Enter deposit amount: ');

  if (amount == null) {
    print('Invalid amount.');
    return;
  }

  bank.deposit(accountNumber, amount);
}

void withdrawMenu(BankService bank) {
  stdout.write('Enter account number: ');
  final accountNumber = stdin.readLineSync()?.trim() ?? '';

  final amount = readAmount('Enter withdrawal amount: ');

  if (amount == null) {
    print('Invalid amount.');
    return;
  }

  bank.withdraw(accountNumber, amount);
}

void checkBalanceMenu(BankService bank) {
  stdout.write('Enter account number: ');
  final accountNumber = stdin.readLineSync()?.trim() ?? '';

  final account = bank.findAccount(accountNumber);

  if (account == null) {
    print('Account not found.');
    return;
  }

  account.displayInfo();
}

double? readAmount(String message) {
  stdout.write(message);

  final input = stdin.readLineSync()?.trim();
  final amount = double.tryParse(input ?? '');

  if (amount == null || !amount.isFinite) {
    return null;
  }

  return amount;
}
