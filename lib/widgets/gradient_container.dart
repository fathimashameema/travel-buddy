import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key, required this.child, this.padding});
  final Widget child;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding:padding?? const EdgeInsets.fromLTRB(25, 45, 25, 0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            
            const Color(0xFF68AFD1),
            const Color.fromARGB(255, 193, 229, 244),
            const Color.fromARGB(255, 206, 236, 248),
            const Color.fromARGB(255, 230, 242, 247),
            Colors.white,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: child,
    );
  }
}
