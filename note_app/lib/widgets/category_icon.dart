import 'package:flutter/material.dart';

class CategoryIcon extends StatefulWidget {
  const CategoryIcon(
      {super.key, required this.onPressed, required this.iconType});

  final void Function() onPressed;
  final IconData iconType;

  @override
  State<CategoryIcon> createState() => _CategoryIconState();
}

class _CategoryIconState extends State<CategoryIcon> {

    Color iconColor = Colors.black38;

    void onPressed(BuildContext context) {
      setState(() {
        if (iconColor == Colors.black38) {
          iconColor = Theme.of(context).colorScheme.primary;
          
        } else if(iconColor == Theme.of(context).colorScheme.primary){
          iconColor = Colors.black38;
        }
      });
    }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){
        onPressed(context);
      },
      icon: Icon(
        widget.iconType,
        size: 28,
        color: iconColor,
      ),
    );
  }
}
