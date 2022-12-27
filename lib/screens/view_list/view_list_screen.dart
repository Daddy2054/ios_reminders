import 'package:flutter/material.dart';
import 'package:ios_reminders/models/reminder/reminder.dart';
import 'package:ios_reminders/models/todo_list/todo_list.dart';
import 'package:provider/provider.dart';

class ViewListScreen extends StatelessWidget {
  final TodoList todoList;

  const ViewListScreen({Key? key, required this.todoList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final allReminders = Provider.of<List<Reminder>>(context);
    final reminderForList = allReminders
        .where((reminder) => reminder.list['id'] == todoList.id)
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(todoList.title),
      ),
      body: ListView.builder(
          itemCount: reminderForList.length,
          itemBuilder: (context, index) {
            final reminder = reminderForList[index];
            return Card(
              child: ListTile(
                title: Text(reminder.title),
              ),
            );
          }),
    );
  }
}
