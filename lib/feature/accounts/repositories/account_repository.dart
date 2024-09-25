import 'package:panorama/feature/accounts/model/account.dart';

abstract class AccountRepository {
  Future<void> addAccount(Account account);
  Future<List<Account>> getAllAccounts();
  Future<Account?> getAccount(String id);
  Future<void> updateAccount(Account account);
  Future<void> deleteAccount(String id);
}
