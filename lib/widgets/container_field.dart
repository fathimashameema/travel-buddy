import 'package:flutter/material.dart';

class ContainerField extends StatelessWidget {
  const ContainerField({
    super.key,
    required this.child,
    this.height,
    this.onTap,
  });

  final Widget child;
  final double? height;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(15),
        alignment: Alignment.center,
        width: double.infinity,
        height: height ?? 55,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: Colors.black87),
          borderRadius: BorderRadius.circular(12),
        ),
        child: child,
      ),
    );
  }
}
