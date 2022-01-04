import 'package:flutter/material.dart';

class TimeCard extends StatelessWidget {
  const TimeCard({Key? key, required this.time, required this.isSelected})
      : super(key: key);
  final String time;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isSelected ? Colors.deepOrange.withOpacity(0.8) : Colors.grey.shade300,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12)
      ),
      child: SizedBox(
        height: 40,
        width: 100,
        child: Center(child: Text(time)),
      ),
    );
  }
}
