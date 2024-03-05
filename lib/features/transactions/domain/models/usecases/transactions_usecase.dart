import 'package:fin_app/features/transactions/data/models/transaction_request_dto.dart';
import 'package:fin_app/features/transactions/domain/models/transaction_model.dart';

class TransactionsUseCase {
  final List<TransactionModel> transactions;

  TransactionsUseCase() : transactions = <TransactionModel>[];

  Future<List<TransactionModel>> getTransactions() async {
    return transactions;
  }

  Future<List<TransactionModel>> addTransaction(TransactionRequestDTO transaction) async {
    transactions.add(transaction);
    return transactions;
  }

  Future<List<TransactionModel>> editTransaction(TransactionModel editedTransaction) async {
    final index = transactions.indexWhere((transaction) => transaction.id == editedTransaction.id);
    transactions[index] = editedTransaction;

    return transactions;
  }

  Future<List<TransactionModel>> deleteTransaction(int transactionId) async {
    transactions.removeWhere((transaction) => transaction.id == transactionId);
    return Future.delayed(const Duration(milliseconds: 500), () => transactions);
  }
}
