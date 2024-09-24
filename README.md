# Expense Manager

## Overview

**Expense Manager** is a personal finance management application built using **Flutter**. It helps users manage their financial transactions efficiently by providing an intuitive interface to track income, expenses, and budgets across different accounts. The project is designed to offer a simple yet powerful way to stay in control of your finances.

## Features

- **Accounts Management**: Users can create and manage multiple accounts (e.g., bank accounts, cash, credit cards).
- **Categories**: Predefined and customizable categories to classify income and expense transactions (e.g., food, travel, bills).
- **Transactions**: Record and manage all financial transactions, whether they are income or expenses, linked to an account and a category.
- **Recurring Transactions**: Support for recurring transactions (e.g., monthly bills or income).
- **Budgeting**: Set budgets for categories and track how much of the budget has been spent.
- **Analytics & Reporting**: Visualize spending patterns with graphs and charts for better financial decision-making.
- **Hive Integration**: Local storage using Hive for storing accounts, categories, and transactions offline.
- **BLoC Pattern**: Implements the BLoC architecture for state management, ensuring scalability and a clean separation of business logic and UI.

## Technologies Used

- **Flutter**: The cross-platform mobile framework used to build the app.
- **Hive**: Lightweight and fast NoSQL database used for local storage.
- **BLoC (Business Logic Component)**: For effective state management, making the application scalable and easy to maintain.
- **fl_chart**: For rendering dynamic charts and graphs representing financial data.

## Installation

1. **Clone the repository**:

   ```bash
   git clone https://github.com/yourusername/expense-manager.git
   ```

2. **Navigate to the project directory**:

   ```bash
   cd expense-manager
   ```

3. **Install dependencies**:

   ```bash
   flutter pub get
   ```

4. **Run the app**:
   ```bash
   flutter run
   ```

## Usage

1. **Create an Account**: Add different financial accounts such as bank, cash, or credit.
2. **Add Categories**: Use predefined categories or create custom ones to organize transactions.
3. **Track Transactions**: Add income or expense transactions to accounts and assign categories to track spending.
4. **Visualize Spending**: View expense reports and breakdowns through graphical reports.

## Screenshots

_Add relevant screenshots of your application here to showcase the UI._

## Future Enhancements

- **Cloud Sync**: Sync data across devices using cloud storage solutions like Firebase.
- **Multi-Currency Support**: Support for transactions in multiple currencies.
- **Dark Mode**: A customizable dark mode theme.
- **More Analytics**: Deeper insights into spending habits with additional graphical reports.

## Contribution

Feel free to fork this repository, create a feature branch, and submit pull requests. Contributions to improve the app are always welcome!

## License

This project is licensed under the MIT License.
