import 'package:fin_app/core/app_state/app_state.dart';
import 'package:fin_app/features/transactions/data/models/transaction_request_dto.dart';
import 'package:fin_app/features/transactions/domain/models/transaction_model.dart';
import 'package:fin_app/features/transactions/domain/models/usecases/transactions_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionsCubit extends Cubit<AppState> {
  final TransactionsUseCase _useCase;

  TransactionsCubit(this._useCase) : super(AppStateDefault());

  Future<void> getTransactions() async {
    emit(AppStateLoading());
    final transactions = await _useCase.getTransactions();
    emit(AppStateSuccess(transactions));
  }

  Future<void> addTransaction({
    required TransactionType type,
    required String name,
    required,
    required String description,
    required int sum,
    required String date,
  }) async {
    final transactionRequestDTO = TransactionRequestDTO(
      name: name,
      description: description,
      sum: type == TransactionType.income ? sum : -sum,
      date: date,
    );
    final transactions = await _useCase.addTransaction(TransactionRequestDTO);
    emit(AppStateSuccess(transactions));
  }
}
