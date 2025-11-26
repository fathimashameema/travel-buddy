import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.style,
  });
  final Widget icon;
  final void Function() onTap;
  final ButtonStyle? style;

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      iconSize: 15,
      color: Colors.black,
      style:
          style ??
          IconButton.styleFrom(
            backgroundColor: Colors.white,
            minimumSize: Size(20, 20),
          ),
      onPressed: onTap,
      icon: icon,
    );
  }
}
