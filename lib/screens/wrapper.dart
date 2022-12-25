import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ios_reminders/models/todo_list/todo_list_collection.dart';
import 'package:provider/provider.dart';

import 'package:ios_reminders/screens/home/addList/add_list_screen.dart';
import 'add_reminder/add_reminder_screen.dart';
import 'auth/authenticate_screen.dart';
import 'home/home_screen.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);

    return ChangeNotifierProvider<TodoListCollection>(
      create: (BuildContext context) => TodoListCollection(),
      child: MaterialApp(
        // initialRoute: '/',
        routes: {
          // '/': (context) => AuthenticateScreen(),
          '/home': (context) => HomeScreen(),
          '/addList': (context) => AddListScreen(),
          '/addReminder': (context) => AddReminderScreen()
        },
        home: user != null ? HomeScreen() : AuthenticateScreen(),
        theme: ThemeData(
            brightness: Brightness.dark,
            scaffoldBackgroundColor: Colors.black,
            appBarTheme: AppBarTheme(backgroundColor: Colors.black),
            iconTheme: IconThemeData(color: Colors.white),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: Colors.blueAccent,
                textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
              ),
            ),
            dividerColor: Colors.grey[600]),
      ),
    );
  }
}
