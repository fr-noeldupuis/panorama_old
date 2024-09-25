import 'package:hive/hive.dart';
import 'package:panorama/feature/accounts/model/account.dart';
import 'package:panorama/feature/accounts/repositories/account_repository.dart'; // Assuming Account is in models

class HiveAccountRepository implements AccountRepository {
  final Box<Account> accountBox;

  HiveAccountRepository(this.accountBox);

  @override
  Future<void> addAccount(Account account) async {
    await accountBox.put(account.id, account);
  }

  @override
  Future<List<Account>> getAllAccounts() async {
    return accountBox.values.toList();
  }

  @override
  Future<Account?> getAccount(String id) async {
    return accountBox.get(id);
  }

  @override
  Future<void> updateAccount(Account account) async {
    await account.save(); // Account extends HiveObject, so it has a save method
  }

  @override
  Future<void> deleteAccount(String id) async {
    await accountBox.delete(id);
  }
}
