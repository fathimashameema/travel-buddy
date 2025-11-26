import 'package:flutter/material.dart';

class CollapsedHeader extends StatelessWidget {
  const CollapsedHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 104, 209, 125),
            Color.fromARGB(255, 174, 240, 195),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: Center(
        child: const Text(
          "Pull up to see your Travel Journal...",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
