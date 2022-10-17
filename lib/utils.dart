import 'package:intl/intl.dart';

/// Formatador de valor monetário
String toMoney(double value){
  return 'R\$ ${value.toStringAsFixed(2)}';
}

/// Formatador de valor de data
String toDateFormat(DateTime data){
  return DateFormat('dd MMM y').format(data).toString();
}

/// Formata String para valor do tipo double
double formatToDouble(String value){
  return double.tryParse(value) ?? 0.0;
}