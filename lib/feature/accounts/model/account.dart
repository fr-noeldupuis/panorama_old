import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

part 'account.g.dart'; // Hive code generation part

// Enum with Hive Adapter
@HiveType(typeId: 1)
enum AccountType {
  @HiveField(0)
  bankAccount(title: "Bank Account"),

  @HiveField(1)
  creditCard(title: "Credit Card"),

  @HiveField(2)
  cash(title: "Cash");

  final String title;

  const AccountType({required this.title});
}

// Account class with Hive support
@HiveType(typeId: 2)
class Account extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String accountName;

  @HiveField(2)
  final AccountType accountType;

  @HiveField(3)
  final double initialBalance;

  @HiveField(4)
  final int colorValue;

  // Constructor
  Account({
    String? id,
    required this.accountName,
    required this.accountType,
    required this.initialBalance,
    required this.colorValue,
  }) : id = id ?? const Uuid().v4();
}
