import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:panorama/feature/accounts/account_form_page.dart';
import 'package:panorama/feature/accounts/account_page_bloc/account_page_bloc.dart';
import 'package:panorama/feature/accounts/model/account.dart';
import 'package:panorama/feature/accounts/repositories/account_repository.dart';
import 'package:panorama/feature/core/app_bar.dart';
import 'package:panorama/feature/core/bottom_navigation_bar.dart';
import 'package:panorama/feature/core/fab.dart';

class AccountsPage extends StatelessWidget {
  const AccountsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Accounts".toUpperCase()),
        titleTextStyle: (Theme.of(context).appBarTheme.titleTextStyle ??
                Theme.of(context).textTheme.titleLarge!)
            .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
        actions: [
          IconButton(
            icon: const Icon(FontAwesome.plus_solid),
            onPressed: () {
              showDialog(
                      context: context,
                      builder: (context) => const AccountTypeSelectionDialog())
                  .then((value) {
                if (value != null) {
                  context.read<AccountPageBloc>().add(AddAccount(value));
                }
              });
            },
          ),
        ],
      ),
      body: BlocBuilder<AccountPageBloc, AccountPageState>(
        builder: (context, state) {
          if (state is AccountPageLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AccountPageLoaded) {
            return ListView.builder(
              itemCount: state.accounts.length,
              itemBuilder: (context, index) {
                final account = state.accounts[index];
                return ListTile(
                  title: Text(
                    account.accountName,
                    style: TextStyle(
                      color: Color(account.colorValue),
                    ),
                  ),
                  subtitle: Text(
                      'Balance: \$${account.initialBalance} - Type: ${account.accountType.title} - ID: ${account.id}'),
                );
              },
            );
          } else if (state is AccountPageError) {
            return Center(child: Text('Failed to load accounts.'));
          }
          return Container();
        },
      ),
      bottomNavigationBar: const PanoramaBottomNavBar(),
    );
  }
}

class AccountTypeSelectionDialog extends StatefulWidget {
  const AccountTypeSelectionDialog({
    super.key,
  });

  @override
  State<AccountTypeSelectionDialog> createState() =>
      _AccountTypeSelectionDialogState();
}

class _AccountTypeSelectionDialogState
    extends State<AccountTypeSelectionDialog> {
  AccountType? _groupValue;
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text('New Account'),
      shape: const BeveledRectangleBorder(),
      children: AccountType.values.map((accountType) {
        return RadioListTile(
          value: accountType,
          groupValue: _groupValue,
          onChanged: (value) {
            setState(() {
              _groupValue = value!;
            });
            Navigator.of(context)
                .push(MaterialPageRoute(
              builder: (context) =>
                  CreateAccountFormPage(accountType: accountType),
            ))
                .then((value) {
              Navigator.of(context).pop(value);
            });
          },
          title: Text(accountType.title),
          subtitle: Text(accountType.index.toString()),
        );
      }).toList(),
    );
  }
}
