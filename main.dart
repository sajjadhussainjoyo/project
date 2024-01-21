import 'dart:io';

class BankAccount {
  String accountHolder;
  String accountNumber;
  double balance;

  BankAccount(this.accountHolder, this.accountNumber, this.balance);

  void deposit(double amount) {
    if (amount > 0) {
      balance += amount;
      print("Deposit successful. New balance: \$${balance.toStringAsFixed(2)}");
    } else {
      print("Invalid amount. Please enter a positive value for deposit.");
    }
  }

  void withdraw(double amount) {
    if (amount > 0) {
      if (balance >= amount) {
        balance -= amount;
        print(
            "Withdrawal successful. New balance: \$${balance.toStringAsFixed(2)}");
      } else {
        print("Insufficient funds. Withdrawal failed.");
      }
    } else {
      print("Invalid amount. Please enter a positive value for withdrawal.");
    }
  }

  void checkBalance() {
    print("Account Balance: \$${balance.toStringAsFixed(2)}");
  }
}

void main() {
  BankAccount? currentAccount;

  while (true) {
    print("\nBank Management System");
    print("1. Create an account");
    print("2. Deposit money");
    print("3. Withdraw money");
    print("4. Check balance");
    print("5. Exit");

    String choice = stdin.readLineSync() ?? "";

    switch (choice) {
      case "1":
        currentAccount = createAccount();
        break;
      case "2":
        depositMoney(currentAccount);
        break;
      case "3":
        withdrawMoney(currentAccount);
        break;
      case "4":
        checkBalance(currentAccount);
        break;
      case "5":
        exit(0);
        break;
      default:
        print("Invalid choice. Please choose a valid option.");
    }
  }
}

BankAccount createAccount() {
  print("Enter account holder name:");
  String accountHolder = stdin.readLineSync() ?? "";

  print("Enter account number:");
  String accountNumber = stdin.readLineSync() ?? "";

  double initialBalance = 0.0;

  // Validate initial balance input
  while (true) {
    print("Enter initial balance:");
    String balanceInput = stdin.readLineSync() ?? "";
    if (isNumeric(balanceInput)) {
      initialBalance = double.parse(balanceInput);
      break;
    } else {
      print(
          "Invalid input. Please enter a valid numeric value for initial balance.");
    }
  }

  BankAccount account =
      BankAccount(accountHolder, accountNumber, initialBalance);
  print("Account created successfully!");
  return account;
}

void depositMoney(BankAccount? account) {
  if (account == null) {
    print("Please create an account first.");
    return;
  }

  // Validate deposit amount input
  while (true) {
    print("Enter the deposit amount:");
    String depositInput = stdin.readLineSync() ?? "";
    if (isNumeric(depositInput)) {
      double depositAmount = double.parse(depositInput);
      account.deposit(depositAmount);
      break;
    } else {
      print(
          "Invalid input. Please enter a valid numeric value for deposit amount.");
    }
  }
}

void withdrawMoney(BankAccount? account) {
  if (account == null) {
    print("Please create an account first.");
    return;
  }

  // Validate withdrawal amount input
  while (true) {
    print("Enter the withdrawal amount:");
    String withdrawalInput = stdin.readLineSync() ?? "";
    if (isNumeric(withdrawalInput)) {
      double withdrawalAmount = double.parse(withdrawalInput);
      account.withdraw(withdrawalAmount);
      break;
    } else {
      print(
          "Invalid input. Please enter a valid numeric value for withdrawal amount.");
    }
  }
}

void checkBalance(BankAccount? account) {
  if (account == null) {
    print("Please create an account first.");
    return;
  }

  account.checkBalance();
}

bool isNumeric(String input) {
  if (input == null) {
    return false;
  }
  return double.tryParse(input) != null;
}
