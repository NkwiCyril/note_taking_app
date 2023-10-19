import 'package:flutter/material.dart';
import 'package:note_app/widgets/category_icon.dart';

class CategoryBar extends StatefulWidget {
  const CategoryBar({super.key});

  @override
  State<CategoryBar> createState() => _CategoryBarState();
}

class _CategoryBarState extends State<CategoryBar> {
  Color bleu = Colors.black;

  void function() {
    setState(() {
      bleu = Colors.purple;
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
           CategoryIcon(iconColor: Colors.black12, onPressed: (){}, iconType: Icons.favorite,),
           CategoryIcon(iconColor: Colors.black12, onPressed: (){}, iconType: Icons.favorite,),
           CategoryIcon(iconColor: Colors.black12, onPressed: (){}, iconType: Icons.favorite,),
           CategoryIcon(iconColor: Colors.black12, onPressed: (){}, iconType: Icons.favorite,),
          ],
        ),
      ),
    );
  }
}
