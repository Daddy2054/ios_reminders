import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ios_reminders/common/widgets/category_icon.dart';
import 'package:ios_reminders/models/category/category.dart';
import 'package:ios_reminders/models/category/category_collection.dart';
import 'package:ios_reminders/models/todo_list/todo_list.dart';
import 'package:ios_reminders/screens/add_reminder/select_reminder_category_screen.dart';
import 'package:ios_reminders/screens/add_reminder/select_reminder_list_screen.dart';
import 'package:provider/provider.dart';

class AddReminderScreen extends StatefulWidget {
  @override
  _AddReminderScreenState createState() => _AddReminderScreenState();
}

class _AddReminderScreenState extends State<AddReminderScreen> {
  final TextEditingController _titleTextController = TextEditingController();

  final TextEditingController _notesTextController = TextEditingController();
  String _title = '';
  //selected list will be the first list
  //TODO: SELECTED LIST
  // PULL IN ALL THE LISTS FROM THE PROVIDER
  // PASS DATA DOWN TO SEELCT LIST SCREEN
  TodoList? _selectedList;
  Category _selectedCategory = CategoryCollection().categories[0];
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

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

  _updateSelectedList(TodoList todoList) {
    setState(() {
      _selectedList = todoList;
    });
  }

  _updateSelectedCategory(Category category) {
    setState(() {
      _selectedCategory = category;
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
    final _todoLists = Provider.of<List<TodoList>>(context);

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
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SelectReminderListScreen(
                            todoLists: _todoLists,
                            selectListCallback: _updateSelectedList,
                            selectedList: _selectedList != null
                                ? _selectedList!
                                : _todoLists.first,
                          ),
                          fullscreenDialog: true,
                        ));
                  },
                  leading: Text(
                    'List',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CategoryIcon(
                          bgColor: Colors.blueAccent,
                          iconData: Icons.calendar_today),
                      SizedBox(width: 10),
                      Text(_selectedList != null
                          ? _selectedList!.title
                          : _todoLists.first.title),
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
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SelectReminderCategoryScreen(
                                selectedCategory: _selectedCategory,
                                selectCategoryCallback: _updateSelectedCategory,
                              ),
                          fullscreenDialog: true),
                    );
                  },
                  leading: Text(
                    'Category',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CategoryIcon(
                          bgColor: _selectedCategory.icon.bgColor,
                          iconData: _selectedCategory.icon.iconData),
                      SizedBox(width: 10),
                      Text(_selectedCategory.name),
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
                  onTap: () async {
                    final DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(
                        Duration(days: 365),
                      ),
                    );
                    if (pickedDate != null) {
                      print(pickedDate);
                      setState(() {
                        _selectedDate = pickedDate;
                      });
                    } else {
                      print('no date was picked');
                    }
                  },
                  leading: Text(
                    'Date',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CategoryIcon(
                          bgColor: Colors.red.shade300,
                          iconData: Icons.calendar_today),
                      SizedBox(width: 10),
                      Text(_selectedDate != null
                          ? DateFormat.yMMMd().format(_selectedDate!).toString()
                          : 'Select Date'),
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
                  onTap: () async {
                    final TimeOfDay? pickedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (pickedTime != null) {
                      print(pickedTime);
                      setState(() {
                        _selectedTime = pickedTime;
                      });
                    } else {
                      print('no time was selected');
                    }
                  },
                  leading: Text(
                    'Time',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CategoryIcon(
                          bgColor: Colors.red.shade300, iconData: Icons.timer),
                      SizedBox(width: 10),
                      Text(_selectedTime != null
                          ? _selectedTime!.format(context).toString()
                          : 'Select Time'),
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
