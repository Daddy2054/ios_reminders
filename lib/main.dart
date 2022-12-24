import 'package:flutter/material.dart';
import 'package:ios_reminders/models/todo_list/todo_list_collection.dart';
import 'package:ios_reminders/screens/add_reminder/add_reminder_screen.dart';
//import 'package:flutter/widgets.dart';
import 'package:ios_reminders/screens/home/addList/add_list_screen.dart';
import 'package:ios_reminders/screens/home/home_screen.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(
    const App(),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TodoListCollection>(
      create: (BuildContext context) => TodoListCollection(),
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
          '/addList': (context) => AddListScreen(),
          '/addReminder': (context) => AddReminderScreen()
        },
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.black,
            appBarTheme: const AppBarTheme(color: Colors.black),
            brightness: Brightness.dark,
            iconTheme: const IconThemeData(color: Colors.white),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                disabledForegroundColor: Colors.blueAccent,
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            dividerColor: Colors.grey[300]),
      ),
    );
    //);
  }
}
