import 'package:flutter/material.dart';

class FieldTitle extends StatelessWidget {
  const FieldTitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
