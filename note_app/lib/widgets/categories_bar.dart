import 'package:flutter/material.dart';

class CategoryBar extends StatefulWidget {
  const CategoryBar({super.key});

  @override
  State<CategoryBar> createState() => _CategoryBarState();
}

class _CategoryBarState extends State<CategoryBar> {
  final Color _bgColor = Colors.transparent;
  final Color _icColor = const Color(0xFF424242);

  void _changeColor() {}

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // padding: const EdgeInsets.all(8),
        constraints: BoxConstraints.loose(const Size.square(250)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          border: Border.all(
              color: Theme.of(context).colorScheme.primary, width: 2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
                onPressed: _changeColor,
                style: IconButton.styleFrom(backgroundColor: _bgColor),
                icon: Icon(
                  Icons.lightbulb,
                  size: 28,
                  color: _icColor,
                )),
            IconButton(
                onPressed: _changeColor,
                style: IconButton.styleFrom(backgroundColor: _bgColor),
                icon: Icon(
                  Icons.person,
                  size: 28,
                  color: _icColor,
                )),
            IconButton(
                onPressed: _changeColor,
                style: IconButton.styleFrom(backgroundColor: _bgColor),
                icon: Icon(
                  Icons.shopping_bag,
                  size: 28,
                  color: _icColor,
                )),
            IconButton(
                onPressed: _changeColor,
                style: IconButton.styleFrom(backgroundColor: _bgColor),
                icon: Icon(
                  Icons.book,
                  size: 28,
                  color: _icColor,
                )),
            IconButton(
                onPressed: _changeColor,
                style: IconButton.styleFrom(backgroundColor: _bgColor),
                icon: Icon(
                  Icons.work,
                  size: 28,
                  color: _icColor,
                )),
          ],
        ),
      ),
    );
  }
}
