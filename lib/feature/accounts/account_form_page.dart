import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:panorama/feature/accounts/account_form_bloc/account_form_bloc.dart';
import 'package:panorama/feature/accounts/model/account.dart';
import 'package:panorama/utils/const.dart'; // Import AccountType enum

class CreateAccountFormPage extends StatelessWidget {
  final AccountType accountType;
  const CreateAccountFormPage({
    super.key,
    this.accountType = AccountType.bankAccount,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AccountFormBloc(accountType: accountType),
      child: BlocBuilder<AccountFormBloc, AccountFormState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('New Account'),
              centerTitle: false,
              leading: IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          shape: const BeveledRectangleBorder(),
                          title: const Text('Discard Changes?'),
                          content: const Text(
                              'Are you sure you want to discard changes?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor:
                                    Theme.of(context).colorScheme.error,
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                              },
                              child: const Text('Discard'),
                            ),
                          ],
                        );
                      });
                },
                icon: const Icon(FontAwesome.xmark_solid),
              ),
              actions: [
                IconButton(
                  icon: const Icon(FontAwesome.check_solid),
                  onPressed: (state is AccountFormValid)
                      ? () {
                          Navigator.of(context).pop(Account(
                            accountName: state.accountName,
                            accountType: state.accountType,
                            initialBalance: state.initialBalance!,
                            colorValue: state.colorValue!,
                          ));
                        }
                      : null,
                ),
              ],
            ),
            body: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Account Name Input
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Account Name',
                    errorText: state is AccountFormInvalid ? state.error : null,
                  ),
                  onChanged: (value) {
                    context
                        .read<AccountFormBloc>()
                        .add(AccountNameChanged(value));
                  },
                ),

                // Account Type Dropdown
                DropdownButtonFormField<AccountType>(
                  decoration: const InputDecoration(labelText: 'Account Type'),
                  value: state.accountType, // Default value
                  items: AccountType.values.map((type) {
                    return DropdownMenuItem(
                      value: type,
                      child: Text(type
                          .title), // Assuming `AccountType` enum has `title`
                    );
                  }).toList(),
                  onChanged: (value) {
                    context
                        .read<AccountFormBloc>()
                        .add(AccountTypeChanged(value!));
                  },
                ),

                // Initial Balance Input
                TextField(
                  decoration:
                      const InputDecoration(labelText: 'Initial Balance'),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    final balance = double.tryParse(value) ?? 0;
                    context
                        .read<AccountFormBloc>()
                        .add(InitialBalanceChanged(balance));
                  },
                ),

                // Color Picker
                // Assuming `availableColors` is a map of `Color` to `List<Color>`
                // and `Colors.red` is a default color
                DropdownButtonFormField<int>(
                  decoration: const InputDecoration(labelText: 'Color'),
                  value: state.colorValue,
                  items: availableColors.keys.map((color) {
                    return DropdownMenuItem(
                      value: color.value,
                      child: Container(
                        color: color,
                        height: 20,
                        width: 20,
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    context.read<AccountFormBloc>().add(ColorChanged(value!));
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
