import 'package:flutter/material.dart';

import '../models/transaction.dart';
import '../utils.dart';

class TransactionalItem extends StatelessWidget {
  const TransactionalItem({
    Key? key,
    required this.tr,
    required this.onRemove,
  }) : super(key: key);

  final Transaction tr;
  final void Function(String p1) onRemove;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
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
        trailing: MediaQuery.of(context).size.width > 480
            ? TextButton.icon(
                onPressed: () => onRemove(tr.id),
                icon: const Icon(Icons.delete),
                label: Text(
                  'Excluir',
                  style: TextStyle(color: Theme.of(context).errorColor),
                ),
              )
            : IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => onRemove(tr.id),
                color: Theme.of(context).errorColor,
              ),
      ),
    );
  }
}
