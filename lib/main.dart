// ignore_for_file: prefer_const_constructors

import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
final _transaction = [
  Transaction(id: 'id', title: 'Compras', value: 12.75, date: DateTime.now())
];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas Pessoais'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
        Container(
          child: Card(
            color: Colors.blue,
            child: Text('Gráfico'),
            elevation: 5,
          ),
        ),
        Column(
          children: _transaction.map((tr){
            return Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10
                  ),
                  decoration: BoxDecoration(
                    border:Border.all(
                      color: Colors.purple,
                      width: 2
                    )
                  ),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    tr.value.toString(),
                    // ignore: prefer_const_constructors
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.purple
                    ),
                  ),
                ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [ 
                  
                  Text(tr.title, style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold
                  ),),
                  Text(tr.date.toString(), style: TextStyle(
                    color: Colors.grey
                  ),),
                  
                ],
              )],
            );
          }).toList(),
        )
      ]),
    );
  }
}
