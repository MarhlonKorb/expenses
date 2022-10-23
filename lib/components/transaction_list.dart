import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

import '../utils.dart';

/// Classe responsável pela listagem de transações cadastradas
class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;

  const TransactionList({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      // Método builder redimensiona os itens na tela de forma que possíbilite o scroll da tela
      child: transaction.isEmpty
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
              itemCount: transaction.length,
              itemBuilder: (BuildContext context, int index) {
                final tr = transaction[index];
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
                    subtitle: Text(dateFormatToString(tr.date)),
                  ),
                );
              },
            ),
    );
  }
}
