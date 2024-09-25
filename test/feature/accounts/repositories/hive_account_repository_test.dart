import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:panorama/feature/accounts/model/account.dart';
import 'package:panorama/feature/accounts/repositories/hive_account_repository.dart';
import 'package:hive/hive.dart';

// Mock class for Hive Box
class MockAccountBox extends Mock implements Box<Account> {}

class MockAccount extends Mock implements Account {}

void main() {
  late MockAccountBox mockAccountBox;
  late HiveAccountRepository accountRepository;

  setUp(() {
    // Initialize mock box and repository before each test
    mockAccountBox = MockAccountBox();
    accountRepository = HiveAccountRepository(mockAccountBox);
  });

  group('HiveAccountRepository', () {
    final testAccount = Account(
      accountName: 'Test Account',
      accountType: AccountType.bankAccount,
      initialBalance: 100.0,
      colorValue: Colors.red.value,
    );

    test('addAccount should store an account in the box', () async {
      // Arrange
      when(() => mockAccountBox.put(testAccount.id, testAccount))
          .thenAnswer((_) async => Future.value());

      // Act
      await accountRepository.addAccount(testAccount);

      // Assert
      verify(() => mockAccountBox.put(testAccount.id, testAccount)).called(1);
    });

    test('getAllAccounts should return list of accounts', () async {
      // Arrange
      when(() => mockAccountBox.values).thenReturn([testAccount]);

      // Act
      final accounts = await accountRepository.getAllAccounts();

      // Assert
      expect(accounts, [testAccount]);
      verify(() => mockAccountBox.values).called(1);
    });

    test('getAccount should return an account by ID', () async {
      // Arrange
      when(() => mockAccountBox.get(testAccount.id)).thenReturn(testAccount);

      // Act
      final account = await accountRepository.getAccount(testAccount.id);

      // Assert
      expect(account, testAccount);
      verify(() => mockAccountBox.get(testAccount.id)).called(1);
    });

    test('updateAccount should save an account', () async {
      // Arrange: Create a mock account and mock the save method
      final mockAccount = MockAccount();
      when(() => mockAccount.save()).thenAnswer((_) async => Future.value());

      // Act: Call the updateAccount method with the mock account
      await accountRepository.updateAccount(mockAccount);

      // Assert: Verify that save was called on the mock account
      verify(() => mockAccount.save()).called(1);
    });

    test('deleteAccount should remove an account by ID', () async {
      // Arrange: Mock the delete method to return a Future
      when(() => mockAccountBox.delete(testAccount.id))
          .thenAnswer((_) async => Future.value());

      // Act
      await accountRepository.deleteAccount(testAccount.id);

      // Assert: Verify that the delete method was called
      verify(() => mockAccountBox.delete(testAccount.id)).called(1);
    });
  });
}
