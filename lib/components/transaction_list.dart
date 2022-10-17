import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

import '../utils.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;

  const TransactionList({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transaction.map((tr) {
        return Row(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.purple, width: 2)),
              padding: const EdgeInsets.all(10),
              child: Text(
                toMoney(tr.value),
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.purple),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tr.title,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  toDateFormat(tr.date),
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            )
          ],
        );
      }).toList(),
    );
  }
}
