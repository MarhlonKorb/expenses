import 'package:flutter/cupertino.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final String value;
  final double percentage;

 ChartBar({
    required this.label,
    required this.value,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('R\$${value}'),
        const SizedBox(height: 5),
        Container(
          height: 60,
          width: 10,
          child: null,
        ),
        const SizedBox(height: 5),
        Text(label)
      ],
    );
  }
}
