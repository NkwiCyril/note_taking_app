import 'package:flutter/material.dart';
import 'package:note_app/model/notes_model.dart';
import 'package:note_app/widgets/category_icon.dart';

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
  void _selectIcon(Category categoryIcon) {
    setState(() {
      widget.onSelectCategory(categoryIcon);
    });
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
            CategoryIcon(
              onPressed: () {
                _selectIcon(Category.idea);
              },
              iconType: Icons.lightbulb,
            ),
            CategoryIcon(
              onPressed: () {
                _selectIcon(Category.personal);
              },
              iconType: Icons.person,
            ),
            CategoryIcon(
              onPressed: () {
                _selectIcon(Category.shopping);
              },
              iconType: Icons.shopping_bag,
            ),
            CategoryIcon(
              onPressed: () {
                _selectIcon(Category.study);
              },
              iconType: Icons.book,
            ),
            CategoryIcon(
              onPressed: () {
                _selectIcon(Category.work);
              },
              iconType: Icons.work,
            ),
          ],
        ),
      ),
    );
  }
}
