import 'package:flutter/material.dart';
import 'package:ios_reminders/common/widgets/category_icon.dart';

class AddReminderScreen extends StatefulWidget {
  @override
  _AddReminderScreenState createState() => _AddReminderScreenState();
}

class _AddReminderScreenState extends State<AddReminderScreen> {
  final TextEditingController _titleTextController = TextEditingController();

  final TextEditingController _notesTextController = TextEditingController();
  String _title = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _titleTextController.addListener(() {
      // print(textController.text);
      setState(() {
        _title = _titleTextController.text;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _titleTextController.dispose();
    _notesTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Reminder'),
        actions: [
          TextButton(
            onPressed: _title.isEmpty
                ? null
                : () {
                    print('add to database');
                  },
            child: const Text(
              'Add',
              style: TextStyle(
        //          color: _listName.isNotEmpty ? null : Colors.grey,
                  ),
            ),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).cardColor),
              child: Column(
                children: [
                  TextField(
                    textCapitalization: TextCapitalization.sentences,
                    controller: _titleTextController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Title',
                    ),
                  ),
                  const Divider(
                    height: 1,
                  ),
                  SizedBox(
                    height: 100,
                    child: TextField(
                      textCapitalization: TextCapitalization.sentences,
                      controller: _notesTextController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Notes',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Card(
                elevation: 0,
                margin: EdgeInsets.zero,
                child: ListTile(
                  onTap: () {},
                  leading: Text(
                    'List',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      CategoryIcon(
                          bgColor: Colors.blueAccent,
                          iconData: Icons.calendar_today),
                      SizedBox(width: 10),
                      Text('New List'),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Card(
                elevation: 0,
                margin: EdgeInsets.zero,
                child: ListTile(
                  onTap: () {},
                  leading: Text(
                    'Category',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      CategoryIcon(
                          bgColor: Colors.blueAccent,
                          iconData: Icons.calendar_today),
                      SizedBox(width: 10),
                      Text('Scheduled'),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
