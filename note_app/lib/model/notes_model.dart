import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

enum Category { study, work, idea, shopping, personal }

final categoryIcons = {
  Category.idea : Icons.lightbulb,
  Category.personal : Icons.person,
  Category.shopping : Icons.shopping_bag,
  Category.study : Icons.book,
  Category.work : Icons.work
};

const uuid = Uuid();

final dateFormat = DateFormat.yMd();

class NotesModel {
  NotesModel({
    required this.title,
    required this.content,
    required this.category,
    required this.date,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final String content;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return dateFormat.format(date);
  }  
}
