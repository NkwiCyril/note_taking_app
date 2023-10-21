import 'package:flutter/material.dart';
import 'package:note_app/widgets/category_icon.dart';

class CategoryBar extends StatefulWidget {
  const CategoryBar({
    super.key,
    required this.onSelectCategory,
  });

  final void Function(IconData selectedIcon) onSelectCategory;

  @override
  State<CategoryBar> createState() => _CategoryBarState();
}

class _CategoryBarState extends State<CategoryBar> {
  void _selectIcon(IconData icon) {
    setState(() {
      widget.onSelectCategory(icon);
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
                _selectIcon(Icons.lightbulb);
              },
              iconType: Icons.lightbulb,
            ),
            CategoryIcon(
              onPressed: () {
                _selectIcon(Icons.person);
              },
              iconType: Icons.person,
            ),
            CategoryIcon(
              onPressed: () {
                _selectIcon(Icons.shopping_bag);
              },
              iconType: Icons.shopping_bag,
            ),
            CategoryIcon(
              onPressed: () {
                _selectIcon(Icons.book);
              },
              iconType: Icons.book,
            ),
            CategoryIcon(
              onPressed: () {
                _selectIcon(Icons.work);
              },
              iconType: Icons.work,
            ),
          ],
        ),
      ),
    );
  }
}
