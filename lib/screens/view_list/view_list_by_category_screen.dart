import 'package:flutter/material.dart';
import 'package:ios_reminders/models/category/category.dart';
import 'package:ios_reminders/models/reminder/reminder.dart';
import 'package:provider/provider.dart';

class ViewListByCategoryScreen extends StatelessWidget {
  final Category category;

  const ViewListByCategoryScreen({Key? key, required this.category})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final allReminders = Provider.of<List<Reminder>>(context);
    final remindersForCategory = allReminders
        .where((reminder) =>
            reminder.categoryId == category.id || category.id == 'all')
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(category.id),
      ),
      body: ListView.builder(
          itemCount: remindersForCategory.length,
          itemBuilder: (context, index) {
            final reminder = remindersForCategory[index];
            return Card(
              child: ListTile(
                title: Text(reminder.title),
              ),
            );
          }),
    );
  }
}
