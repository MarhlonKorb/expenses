import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

import '../utils.dart';

/// Classe responsável pela listagem de cadastro de transações cadastradas
class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;

  const TransactionList({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      // Método builder redimensiona os itens na tela de forma que possíbilite o scroll da tela
      child: ListView.builder(
        itemCount: transaction.length,
        itemBuilder: (BuildContext context, int index) {
          final tr = transaction[index];
          return Card(
              child: Row(
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).primaryColor, width: 2)),
                    
                padding: const EdgeInsets.all(10),
                child: Text(
                  toMoney(tr.value),
                  style:  TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Theme.of(context).primaryColor),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tr.title,
                    style: Theme.of(context).textTheme.headline1),
                    
                    // style: const TextStyle(
                    //     fontSize: 16, fontWeight: FontWeight.bold),
                  
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

  void add(Transaction newTransaction) {}
}
