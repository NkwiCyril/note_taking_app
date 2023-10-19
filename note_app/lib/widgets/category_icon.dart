import 'package:flutter/material.dart';

class CategoryIcon extends StatelessWidget {
  const CategoryIcon({
    super.key,
    required this.iconColor,
    required this.onPressed,
    required this.iconType
  });

  final Color iconColor;
  final void Function() onPressed;
  final IconData iconType;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        iconType,
        size: 28,
        color: iconColor,
      ),
    );
  }
}
