import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

import '../utils.dart';

/// Classe responsável pela listagem de transações cadastradas
class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;

  const TransactionList({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                              color: Theme.of(context).colorScheme.primary,
                              width: 2)),
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        toMoney(tr.value),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Theme.of(context).colorScheme.primary),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(tr.title,
                            style: Theme.of(context).textTheme.headline1),
                        Text(
                          toDateFormat(tr.date),
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    )
                  ],
                ));
              },
            ),
    );
  }
}
