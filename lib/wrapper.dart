import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ios_reminders/models/reminder/reminder.dart';
import 'package:ios_reminders/models/todo_list/todo_list.dart';
import 'package:ios_reminders/services/database_service.dart';
//import 'package:ios_reminders/models/todo_list/todo_list_collection.dart';
import 'package:provider/provider.dart';
import 'package:ios_reminders/config/custom_theme.dart';

import 'package:ios_reminders/screens/home/addList/add_list_screen.dart';
import 'screens/add_reminder/add_reminder_screen.dart';
import 'screens/auth/authenticate_screen.dart';
import 'screens/home/home_screen.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    final customTheme = Provider.of<CustomTheme>(context);

    return MultiProvider(
      providers: [
        StreamProvider<List<TodoList>>.value(
            initialData: [],
            value: user != null
                ? DatabaseService(uid: user.uid).todoListStream()
                : null),
        StreamProvider<List<Reminder>>.value(
            value: user != null
                ? DatabaseService(uid: user.uid).remindersStream()
                : null,
            initialData: [])
      ],
      child: MaterialApp(
        // initialRoute: '/',
        routes: {
          // '/': (context) => AuthenticateScreen(),
          '/home': (context) => HomeScreen(),
          '/addList': (context) => AddListScreen(),
          '/addReminder': (context) => AddReminderScreen()
        },
        home: user != null ? HomeScreen() : AuthenticateScreen(),
        theme: customTheme.lightTheme,
        darkTheme: customTheme.darkTheme,
        themeMode: customTheme.currentTheme(),
      ),
    );
  }
}
