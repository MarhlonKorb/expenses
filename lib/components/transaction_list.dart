import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

import '../utils.dart';

/// Classe responsável pela listagem de transações cadastradas
class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  const TransactionList(this.transactions, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 430,
      // Método builder redimensiona os itens na tela de forma que possíbilite o scroll da tela
      child: transactions.isEmpty
          ? Column(
              children: [
                const SizedBox(height: 20),
                Text('Nenhuma transação cadastrada.',
                    style: Theme.of(context).textTheme.headline1),
                const SizedBox(height: 40),
                SizedBox(
                    height: 200,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ))
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (BuildContext context, int index) {
                final tr = transactions[index];
                return Card(
                  elevation: 5,
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.purple,
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: FittedBox(child: Text(moneyToStringFormat(tr.value))),
                      ),
                    ),
                    title: Text(
                      tr.title,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    subtitle: Text(dateFormatDefaltToString(tr.date)),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete), onPressed: () => onRemove(tr.id),
                      color: Theme.of(context).errorColor,
                    ),
                  ),
                );
              },
            ),
    );
  }
}
