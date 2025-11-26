import 'package:flutter/material.dart';

class SubHeading extends StatelessWidget {
  const SubHeading({super.key, required this.heading});
  final String heading;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios, size: 20),
        ),
        Text(
          heading,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
