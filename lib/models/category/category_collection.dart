import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:ios_reminders/common/widgets/category_icon.dart';
import 'package:ios_reminders/models/category/category.dart';

class CategoryCollection {
  final List<Category> _categories = [
    Category(
      id: 'today',
      name: 'Today',
      icon: const CategoryIcon(
        bgColor: Colors.blue,
        iconData: Icons.calendar_today,
      ),
    ),
    Category(
      id: 'scheduled',
      name: 'Scheduled',
      icon: const CategoryIcon(
        bgColor: Colors.red,
        iconData: Icons.calendar_today,
      ),
    ),
    Category(
      id: 'all',
      name: 'All',
      icon: const CategoryIcon(
        bgColor: Colors.grey,
        iconData: Icons.inbox_rounded,
      ),
    ),
    Category(
      id: 'flagged',
      name: 'Flagged',
      icon: const CategoryIcon(
        bgColor: Colors.orange,
        iconData: Icons.flag_circle,
      ),
    ),
  ];

  UnmodifiableListView<Category> get categories =>
      UnmodifiableListView(_categories);

  Category removeItem(index) {
    return _categories.removeAt(index);
  }

  void insert(index, item) {
    _categories.insert(index, item);
  }

    List<Category> get selectedCategories {
    return _categories.where((category) => category.isChecked).toList();
  }
}
