import 'package:intl/intl.dart';

/// Formatador de valor monetário para tipo String
String moneyToStringFormat(double value){
  return 'R\$ ${value.toStringAsFixed(2)}';
}

/// Formatador de valor de data para tipo String / 20 Oct 2022
String dateFormatToString(DateTime data){
  return DateFormat('dd MMM y').format(data).toString();
}

/// Formatador de valor de data para tipo String / 20/10/2022
String dateFormatDefaltToString(DateTime data){
  return DateFormat('dd/MM/y').format(data).toString();
}

/// Formata String para valor do tipo double
double stringToDouble(String value){
  return double.tryParse(value) ?? 0.0;
}