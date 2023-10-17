import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10,
      ),
      child: TextField(
        decoration: InputDecoration(
          border:  const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          constraints: BoxConstraints.loose(const Size(400, 50)),
          prefixIconColor: Theme.of(context).colorScheme.primary,
          fillColor: Colors.grey.shade400,
          prefixIcon: const Icon(Icons.search),
          hintText: 'Search',
        ),
      ),
    );
  }
}
