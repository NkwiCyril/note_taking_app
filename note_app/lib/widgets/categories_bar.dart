import 'package:flutter/material.dart';
import 'package:note_app/model/notes_model.dart';

class CategoryBar extends StatefulWidget {
  const CategoryBar({
    super.key,
    required this.onSelectCategory,
  });

  final void Function(Category selectedCategory) onSelectCategory;

  @override
  State<CategoryBar> createState() => _CategoryBarState();
}

class _CategoryBarState extends State<CategoryBar> {
  void _selectCategory(Category categoryIcon) {
    setState(
      () {
        widget.onSelectCategory(categoryIcon);
      },
    );
  }

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
              onPressed: () {
                _selectCategory(Category.idea);
              },
              icon: Icon(
                categoryIcons[Category.idea],
                size: 28,
                color: Colors.black,
              ),
            ),
            IconButton(
              onPressed: () {
                _selectCategory(Category.study);
              },
              icon: Icon(
                categoryIcons[Category.study],
                size: 28,
                color: Colors.black,
              ),
            ),
            IconButton(
              onPressed: () {
                _selectCategory(Category.shopping);
              },
              icon: Icon(
                categoryIcons[Category.shopping],
                size: 28,
                color: Colors.black,
              ),
            ),
            IconButton(
              onPressed: () {
                _selectCategory(Category.work);
              },
              icon: Icon(
                categoryIcons[Category.work],
                size: 28,
                color: Colors.black,
              ),
            ),
            IconButton(
              onPressed: () {
                _selectCategory(Category.personal);
              },
              icon: Icon(
                categoryIcons[Category.personal],
                size: 28,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
