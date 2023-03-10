import 'package:flutter/material.dart';
import 'package:ios_reminders/models/todo_list/todo_list.dart';
import 'package:ios_reminders/screens/add_reminder/add_reminder_screen.dart';
import 'package:ios_reminders/screens/home/addList/add_list_screen.dart';
import 'package:provider/provider.dart';

class Footer extends StatelessWidget {
  // final addNewListCallback;

  // const Footer({
  //   required this.addNewListCallback,
  // });

  @override
  Widget build(BuildContext context) {
    final todoLists = Provider.of<List<TodoList>>(context);

    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton.icon(
            onPressed: todoLists.length > 0
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddReminderScreen(),
                            fullscreenDialog: true),
                      );
                    }
                  : null,
            icon: const Icon(Icons.add_circle),
            label: const Text('New Reminder'),
          ),
          TextButton(
            onPressed: () {
              //              TodoList newList = await
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddListScreen(),
                    fullscreenDialog: true),
              );
              //        addNewListCallback(newList);
            },
            child: Text('Add List'),
          )
        ],
      ),
//              color: Colors.blue,
    );
  }
}
