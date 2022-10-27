import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

import 'transactionalItem.dart';

/// Classe responsável pela listagem de transações cadastradas
class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  const TransactionList(this.transactions, this.onRemove, {super.key});

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: [
                const SizedBox(height: 20),
                Text('Nenhuma transação cadastrada.',
                    style: Theme.of(context).textTheme.headline1),
                SizedBox(height: constraints.maxHeight * 0.05),
                SizedBox(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ))
              ],
            );
          })
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (BuildContext context, int index) {
              final tr = transactions[index];
              return TransactionalItem(tr: tr, onRemove: onRemove);
            },
          );
  }
}